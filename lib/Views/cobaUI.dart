import 'package:flutter/material.dart';
import 'package:provider_http_req/Data/Data.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/Text_Styles.dart';
import 'package:provider_http_req/Widgets/buttons.dart';

class CobaUi extends StatefulWidget {
  final Map<String, dynamic> list;
  const CobaUi({this.list});
  @override
  _CobaUiState createState() => _CobaUiState();
}

class _CobaUiState extends State<CobaUi> {
  PageController controller = PageController();
  bool ulasan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.body,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 3.046,
                        width: double.maxFinite,
                        child: Stack(
                          children: <Widget>[
                            pageImage(context, widget.list),
                            appBar(context),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).size.height / 3.046 +
                                  ((MediaQuery.of(context).padding.top) +
                                      (16 -
                                          (MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                              2))) -
                              ((MediaQuery.of(context).padding.bottom) +
                                  (16 -
                                      (MediaQuery.of(context).padding.bottom) /
                                          2)) -
                              22 -
                              16,
                          alignment: Alignment.topLeft,
                          child: value(context, widget.list)),
                    ],
                  ),
                  btn(context, widget.list)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageImage(BuildContext context, Map<String, dynamic> list) {
    return PageView.builder(
        itemCount: list["image"].length,
        controller: controller,
        pageSnapping: true,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Image.asset(
                list["image"][index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: DataColors.one.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  child: Text(
                    "${index + 1}/${list["image"].length}",
                    style: AppStyles.textHelper(context)
                        .copyWith(color: DataColors.white),
                  ),
                ),
              )
            ],
          );
        });
  }

  value(BuildContext context, Map<String, dynamic> list) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, top: 24, right: 16, bottom: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sapi Limousin",
              style: AppStyles.headline1(context),
            ),
            SizedBox(height: 4.0),
            Row(children: <Widget>[
              Icon(
                Icons.star,
                color: DataColors.alert,
              ),
              Icon(
                Icons.star,
                color: DataColors.alert,
              ),
              Icon(
                Icons.star,
                color: DataColors.alert,
              ),
              Icon(
                Icons.star,
                color: DataColors.alert,
              ),
              Icon(
                Icons.star_border,
                color: DataColors.alert,
              ),
              Text(
                " ${widget.list["rating"]} (${widget.list["review"].length})",
                style: AppStyles.subhead(context),
              )
            ]),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: DataColors.tri,
                ),
                Text(
                  " ${widget.list["alamat"]}",
                  style: AppStyles.subhead(context),
                )
              ],
            ),
            iconValue(widget.list),
            SizedBox(height: 16.0),
            infoValue(widget.list),
            SizedBox(height: 16.0),
            ulasanValue(widget.list),
            SizedBox(height: 16.0),
            rekomendasiValue(widget.list)
          ],
        ),
      ),
    );
  }

  Widget iconValue(Map list) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              margin: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DataColors.primer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6.0)),
              child: InkWell(
                  child: Icon(
                Icons.date_range,
                color: DataColors.primer,
              )),
            ),
            Text(
              "${list["umur"]} Bulan",
              style: AppStyles.subhead(context),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              margin: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DataColors.primer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6.0)),
              child: InkWell(
                  child: Icon(
                Icons.web_asset,
                color: DataColors.primer,
              )),
            ),
            Text(
              "${list["berat"]} Kg",
              style: AppStyles.subhead(context),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              margin: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DataColors.primer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6.0)),
              child: InkWell(
                  child: Icon(
                Icons.add_circle_outline,
                color: DataColors.primer,
              )),
            ),
            Text(
              "${list["gender"]}",
              style: AppStyles.subhead(context),
            )
          ],
        ),
      ],
    );
  }

  Widget infoValue(Map list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Informasi",
          style: AppStyles.headline2(context),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          list["discription"],
          style: AppStyles.discriptionText(context)
              .copyWith(letterSpacing: 0.2, height: 1.5),
        ),
        SizedBox(
          height: 4.0,
        ),
        Align(
          alignment: Alignment.center,
          child: MaterialButton(
              child: Text("Selengkapnya",
                  style: AppStyles.subhead(context)
                      .copyWith(color: DataColors.primer)),
              onPressed: () {}),
        )
      ],
    );
  }

  Widget ulasanValue(Map list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Ulasan",
          style: AppStyles.headline2(context),
        ),
        SizedBox(height: 4.0),
        Column(children: mapUlasan(list)),
        SizedBox(
          height: 4.0,
        ),
        Align(
          alignment: Alignment.center,
          child: MaterialButton(
              child: Text("Selengkapnya",
                  style: AppStyles.subhead(context)
                      .copyWith(color: DataColors.primer)),
              onPressed: () {
                setState(() {
                  if (ulasan)
                    ulasan = false;
                  else
                    ulasan = true;
                });
              }),
        ),
      ],
    );
  }

  mapUlasan(Map list) {
    List<Widget> data = [];
    for (var i = 0; i < (ulasan ? list["review"].length : 2); i++) {
      data.add(Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(list["review"][i]["profil"]),
            ),
            title: Row(
              children: <Widget>[
                Text(list["review"][i]["nama"]),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: DataColors.alert,
                        ),
                        Text(" ${list["review"][i]["reting"]}")
                      ],
                    ),
                  ],
                ))
              ],
            ),
            subtitle: Text("${list["review"][i]["pesan"]}"),
            onTap: () {},
          ),
          Divider()
        ],
      ));
    }
    return data;
  }

  Widget rekomendasiValue(Map list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Rekomendasi",
          style: AppStyles.headline2(context),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: Data.kebutuhan.map((f) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 186,
                  decoration: BoxDecoration(color: DataColors.white),
                  child: Stack(
                    // fit: StackFit.passthroug,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 186,
                        child: Image.asset(
                          f["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              f["nama"],
                              style: AppStyles.headline3(context),
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              children: <Widget>[
                                Icon(Icons.shopping_basket,
                                    size: 20, color: DataColors.five),
                                SizedBox(width: 4.0),
                                Text(
                                  "${f["jumlah"].toString()} ${f["satuan"]}",
                                  style: AppStyles.discriptionText(context),
                                )
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Rp ${f["harga"]}00",
                              style: AppStyles.discriptionItem(context)
                                  .copyWith(color: DataColors.success),
                            )
                          ],
                        ),
                        bottom: 12.0,
                        left: 12.0,
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(8, 38, 0, 0),
          child: ClipOval(
            child: Container(
              color: DataColors.one.withOpacity(0.3),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: DataColors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 38, 8, 0),
          child: ClipOval(
            child: Container(
              color: DataColors.one.withOpacity(0.3),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: DataColors.white),
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  btn(BuildContext context, Map<String, dynamic> list) {
    return Container(
      width: double.maxFinite,
      color: DataColors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsetsDirectional.fromSTEB(16, 9, 0, 0),
                  child: Text(
                    "Harga",
                    style: AppStyles.headline3(context),
                  )),
              Container(
                  margin: EdgeInsetsDirectional.fromSTEB(16, 9, 16, 0),
                  child: Text(
                    "Rp ${list["harga"]}",
                    style: AppStyles.headline3(context)
                        .copyWith(color: DataColors.success),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              smlBtn(
                  context,
                  Icon(
                    Icons.chat,
                    color: DataColors.six,
                  ),
                  EdgeInsetsDirectional.fromSTEB(
                    16,
                    12,
                    16,
                    (MediaQuery.of(context).padding.bottom) +
                        (16 - (MediaQuery.of(context).padding.bottom) / 2),
                  )),
              smlBtn(
                  context,
                  Icon(
                    Icons.shopping_cart,
                    color: DataColors.six,
                  ),
                  EdgeInsetsDirectional.fromSTEB(
                    0,
                    12,
                    0,
                    (MediaQuery.of(context).padding.bottom) +
                        (16 - (MediaQuery.of(context).padding.bottom) / 2),
                  )),
              AppButton(text: "Beli",)
            ],
          ),
        ],
      ),
    );
  }
}

Widget smlBtn(BuildContext context, Icon icon, EdgeInsetsDirectional margin) {
  return Container(
    width: 42,
    height: 42,
    decoration: BoxDecoration(
        color: DataColors.body,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: DataColors.line, width: 1.5)),
    margin: margin,
    child: Stack(
      // fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: icon,
        ),
        MaterialButton(
          splashColor: DataColors.six.withOpacity(0.3),
          highlightColor: DataColors.six.withOpacity(0.15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          onPressed: () {},
        ),
      ],
    ),
  );
}
