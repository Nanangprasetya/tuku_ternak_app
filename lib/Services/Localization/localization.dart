import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_http_req/Util/text_localization.dart';
import 'package:provider_http_req/l10n/messages_all.dart';

class MyLocalization extends TextLocalization {
  static Future<MyLocalization> load(Locale local) {
    // locale = local;
    final String name =
        local.countryCode.isEmpty ? local.languageCode : local.toString();

    final String localName = Intl.canonicalizedLocale(name);

    return initializeMessages(localName).then((_) {
      Intl.defaultLocale = localName;
      return MyLocalization();
    });
  }

  static MyLocalization of(BuildContext context) {
    return Localizations.of<MyLocalization>(context, MyLocalization);
  }
}

class MyLocalizationDelegate extends LocalizationsDelegate<MyLocalization> {
  final Locale locale;

  const MyLocalizationDelegate(this.locale);

  @override
  bool isSupported(Locale locale) {
    return ['id', 'en'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalization> load(Locale locale) {
    return MyLocalization.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalization> old) {
    return false;
  }
}

// RUN: run created intl_messages.arb
// flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/Sevices/Localization/localization.dart
//
// RUN : run for converts arb to .dart models
// flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_messages.arb lib/l10n/intl_en.arb lib/l10n/intl_id.arb lib/Services/Localization/localization.dart
