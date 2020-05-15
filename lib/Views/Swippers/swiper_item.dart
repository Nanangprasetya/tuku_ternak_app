import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/size_config.dart';

class SwipperItem extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;
  final Widget child;

  const SwipperItem({Key key, this.title, this.image, this.subtitle, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.3),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.heightMultiplier * 2.3),
                child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsetsDirectional.only(
                  top: SizeConfig.heightMultiplier * 5),
              alignment: Alignment.center,
              // margin: EdgeInsetsDirectional.fromSTEB(, top, end, bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.8, //24
                          color: DataColors.one,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.7,
                  ),
                  Text(subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: DataColors.four,
                          letterSpacing: 0.2,
                          fontSize: SizeConfig.heightMultiplier * 1.9, //16
                          fontWeight: FontWeight.normal,
                          height: 1.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
