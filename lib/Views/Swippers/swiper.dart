import 'package:flutter/material.dart';
import 'package:provider_http_req/Services/Localization/localization.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/images.dart';
import 'package:provider_http_req/Util/router_constants.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Views/Swippers/swiper_item.dart';
import 'package:provider_http_req/Widgets/app_tamplate.dart';
import 'package:provider_http_req/Widgets/buttons.dart';

class Swipper extends StatefulWidget {
  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swipper> {
  int currentPageValue = 0;
  PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: currentPageValue);
    super.initState();
  }

  void getChangePage(int page) {
    setState(() {
      currentPageValue = page;
    });
    print(currentPageValue);
  }

  void navigation() {
    MyNavigator.goToLoginHome(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> swiperItem = <Widget>[
      SwipperItem(
        title: MyLocalization.of(context).titleSwiper1,
        subtitle: MyLocalization.of(context).subTitleSwiper1,
        image: ImageData.swip1,
      ),
      SwipperItem(
        title: MyLocalization.of(context).titleSwiper2,
        subtitle: MyLocalization.of(context).subTitleSwiper2,
        image: ImageData.swip2,
      ),
      SwipperItem(
        title: MyLocalization.of(context).titleSwiper3,
        subtitle: MyLocalization.of(context).subTitleSwiper3,
        image: ImageData.swip3,
      ),
    ];

    return DraftBar(
      appBarDevider: false,
      action: <Widget>[
        FlatButton(
          onPressed: navigation,
          child: Text(
            "SKIP",
            style: TextStyle(
                fontSize: 16, //18
                color: DataColors.primer),
          ),
        )
      ],
      body: Stack(
        children: <Widget>[
          PageView.builder(
              controller: controller,
              physics: ClampingScrollPhysics(),
              itemCount: swiperItem.length,
              onPageChanged: (int i) {
                getChangePage(i);
              },
              itemBuilder: (BuildContext context, int i) {
                return swiperItem[i];
              }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < swiperItem.length; i++)
                          if (i == currentPageValue) ...[animatedDot(true)] else
                            animatedDot(false),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.widthMultiplier * 3.5, //16
                      horizontal: SizeConfig.widthMultiplier * 3.5), //16
                  child: AnimatedOpacity(
                      opacity: currentPageValue == 2 ? 1 : 0,
                      duration: Duration(milliseconds: 100),
                      child: AppButton(
                        text: MyLocalization.of(context).getBtnStarted,
                        onTab: currentPageValue == 2 ? navigation : null,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget animatedDot(bool active) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
      height: SizeConfig.heightMultiplier * 0.6,
      width: SizeConfig.widthMultiplier * 4.4,
      margin: EdgeInsets.only(
        left: SizeConfig.heightMultiplier,
      ),
      decoration: BoxDecoration(
          color: active ? DataColors.primer : Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 1)),
    );
  }
}
