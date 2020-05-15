import 'package:intl/intl.dart';

class TextLocalization {
  String get getTukuternak {
    return Intl.message('Tukuternak',
        name: 'getTukuternak', desc: 'Tukuternak Title');
  }

//Text Field Label
  String get getEmailLabel {
    return Intl.message('Email ID', name: 'getEmailLabel', desc: 'signUn');
  }

  String get getPhoneLabel {
    return Intl.message('Nomer Telepon',
        name: 'getPhoneLabel', desc: 'signIn, SignUp');
  }

  String get getPasswordLabel {
    return Intl.message('Password', name: 'getPasswordLabel', desc: 'signUp');
  }

//Text Field Validation
  String get getEmptyValidationForm {
    return Intl.message('Tidak boleh Kosong!',
        name: 'getEmptyValidationForm', desc: 'Textfield');
  }

  String get getPhoneValidationForm {
    return Intl.message('Nomer telepon tidak benar!',
        name: 'getPhoneValidationForm', desc: 'Textfield Phone');
  }

  String get getEmailValidationForm {
    return Intl.message('Email tidak benar',
        name: 'getEmailValidationForm', desc: 'Textfield Email');
  }

  String get getPasswordValidationForm {
    return Intl.message('Password kurang aman',
        name: 'getPasswordValidationForm', desc: 'Textfield Password');
  }

  String get getOtpValidationForm {
    return Intl.message('Otp tidak benar',
        name: 'getOtpValidationForm', desc: 'Textfield Otp');
  }

//Text Field Hint
String get getEmailHint {
  return Intl.message('kitabisa@contoh.com', name: 'getEmailHint', desc: 'Hint text form');
}
String get getPhoneHint {
  return Intl.message('821639173343', name: 'getPhoneHint', desc: 'hint text form');
}
String get getPasswordHint {
  return Intl.message('******', name: 'getPasswordHint', desc: 'hint text form');
}
String get getOtpHint {
  return Intl.message('_ _ _ _ _', name: 'getOtpHint', desc: 'hint text');
}

//Btn
  String get getBtnRegister {
    return Intl.message('DAFTAR', name: 'getBtnRegister', desc: 'loginHome');
  }

  String get getBtnLogin {
    return Intl.message('MASUK', name: 'getBtnLogin', desc: 'loginHome');
  }

  String get getBtnGoogle {
    return Intl.message('GOOGLE', name: 'getBtnGoogle', desc: 'loginHome');
  }

  String get getBtnVerification {
    return Intl.message('VERIFIKASI',
        name: 'getBtnVerification', desc: 'signIn, signUp');
  }

  String get getBtnStarted {
    return Intl.message('COBA SEKARANG',
        name: 'getBtnStarted', desc: 'btnSwipper');
  }

//Swipper
  String get titleSwiper1 {
    return Intl.message('Terdapat 300 lebih Ternak yang dipasarkan',
        name: 'titleSwiper1', desc: 'title');
  }

  String get titleSwiper2 {
    return Intl.message('Mudah dalam Pembelian dan Pembayaran',
        name: 'titleSwiper2', desc: 'title');
  }

  String get titleSwiper3 {
    return Intl.message('Ternak Berkualitas dan Harga Terjangkau',
        name: 'titleSwiper3', desc: 'title');
  }

  String get subTitleSwiper1 {
    return Intl.message(
        'Tukuternak telak berkerja sama dengan penjual-penjual di seluruh Indonesia untuk mepasarkan Ternak mereka',
        name: 'subTitleSwiper1',
        desc: 'subTitle');
  }

  String get subTitleSwiper2 {
    return Intl.message(
        'Kami menawarkan fitur kemudahan dalam bertransaksi jual beli dan Kemudahaan Pembayaran',
        name: 'subTitleSwiper2',
        desc: 'subTitle');
  }

  String get subTitleSwiper3 {
    return Intl.message(
        'Kam menjual Ternak yang bersetatus Tervalidasi dan kami  pantau Ketersedaian Ternak',
        name: 'subTitleSwiper3',
        desc: 'subTitle');
  }

//LoginHome
  String get getTextPrivacy1 {
    return Intl.message('Dengan masuk atau mendaftar, kamu menyetujui',
        name: 'getTextPrivacy1', desc: 'loginHome');
  }

  String get getTextPrivacy2 {
    return Intl.message(' Ketentuan Layanan dan Kebijakan Privasi.',
        name: 'getTextPrivacy2', desc: 'loginHome');
  }

//Sign In
  String get getTitleSignIn {
    return Intl.message('Login untuk Tukuternak',
        name: 'getTitleSignIn', desc: 'signIn');
  }

  String get getSubTitleSignIn {
    return Intl.message(
        'Masukan Nomer Talapone anda agar dapat masuk ke halaman Tukuternak!',
        name: 'getSubTitleSignIn',
        desc: 'signIn');
  }

//Sign Up
  String get getTitleSignUp {
    return Intl.message('Registrasi untuk Tukuternak',
        name: 'getTitleSignUp', desc: 'signUp');
  }

  String get getSubTitleSignUp {
    return Intl.message('Masukan data-data dibawah ini dengan benar!',
        name: 'getSubTitleSignUp', desc: 'signUp');
  }

//Login Verification
  String get getTitleLoginVerification {
    return Intl.message('Verifikasi Nomer Telepon',
        name: 'getTitleLoginVerification', desc: 'loginVerification');
  }

  String get getSubTitleLoginVerification {
    return Intl.message(
        'Masukan kode verifikasi yang telah kami kirimkan ke nomer telepone\t',
        name: 'getSubTitleLoginVerification',
        desc: 'loginVerification');
  }

  String get getOtpTimerOut {
    return Intl.message('Sisa waktu',
        name: 'getOtpTimerOut', desc: 'loginVerification');
  }

  String get getTextResend1 {
    return Intl.message('Tidak menerima Kode Verifikasi?, ',
        name: 'getTextResend1', desc: 'loginVerification');
  }

  String get getTextResend2 {
    return Intl.message('Kirim ulang Kode',
        name: 'getTextResend2', desc: 'loginVerification');
  }
}

// RUN: run created intl_messages.arb
//flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/Util/text_localization.dart
//
// RUN : run for converts arb to .dart models
// flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_messages.arb lib/l10n/intl_en.arb lib/l10n/intl_id.arb lib/Util/text_localization.dart

