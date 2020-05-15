import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/Text_Styles.dart';
import 'package:provider_http_req/Util/images.dart';
import 'package:provider_http_req/Util/size_config.dart';

enum StyleButton { primer, outlite }

class AppButton extends StatelessWidget {
  final String text;
  final Function onTab;
  final StyleButton style;
  final double maxWidth;
  final double opacity;
  final String imageLeft;

  const AppButton(
      {Key key,
      @required this.text,
      this.style = StyleButton.primer,
      this.maxWidth,
      this.opacity,
      this.imageLeft,
      this.onTab})
      : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1, //Custom
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Visibility(
            visible: imageLeft != null,
            child: Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Image.asset(
                imageLeft ?? ImageData.logoGoogle,
                height: 24,
                width: 24,
              ),
            ),
          ),
          Container(
            height: 48,
            width: maxWidth ?? SizeConfig.screenWidth, //custom
            margin: EdgeInsetsDirectional.fromSTEB(
              0,
              15,
              0,
              (MediaQuery.of(context).padding.bottom) +
                  (16 - (MediaQuery.of(context).padding.bottom) / 2),
            ), //custom
            decoration: style == StyleButton.primer
                ? BoxDecoration(
                    color: DataColors.primer,
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                        BoxShadow(
                            color: DataColors.primer.withOpacity(0.25),
                            offset: Offset(0, 8),
                            blurRadius: 16,
                            spreadRadius: -4.0)
                      ])
                : null,
            child: FlatButton(
              splashColor: style == StyleButton.primer
                  ? DataColors.white.withOpacity(0.3)
                  : DataColors.eight.withOpacity(0.3),
              highlightColor: style == StyleButton.primer
                  ? DataColors.white.withOpacity(0.15)
                  : DataColors.eight.withOpacity(0.15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  side: style == StyleButton.outlite
                      ? BorderSide(
                          color: DataColors.primer,
                          width: 1.5,
                          style: BorderStyle.solid)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(6.0)),
              child: AutoSizeText(
                text,
                style: AppStyles.subhead(context).copyWith(
                    color: style == StyleButton.primer
                        ? DataColors.white
                        : DataColors.primer),
                textAlign: TextAlign.center,
                maxLines: 1,
                stepGranularity: 0.1,
              ),

              onPressed: onTab, //custom
            ),
          ),
        ],
      ),
    );
  }
}
