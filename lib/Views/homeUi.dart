import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_http_req/Data/Data.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/Text_Styles.dart';
import 'package:provider_http_req/Views/cobaUI.dart';
import 'package:provider_http_req/Widgets/app_tamplate.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DraftBar(
      body: CustomScrollView(
        slivers: <Widget>[
          search(context),
          nameTag("Kategori", context),
          gridKategori(context),
          nameTag("Rekomendasi Ternak", context),
          listRekomendasi(context),
          nameTag("Kebutuhan", context),
          listKebutuhan(context)
        ],
      ),
      appBar: true,
      appBarDevider: true,
      action: <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_cart, color: DataColors.tri),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.notifications,
              color: DataColors.tri,
            ),
            onPressed: () {}),
      ],
      text: Text(
        "TukuTernak",
        style: AppStyles.headline2(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: DataColors.five,
        selectedItemColor: DataColors.primer,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Chat")),
        BottomNavigationBarItem(icon: Icon(Icons.adb), title: Text("Transaksi")),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Akun")),
      ]),
    );
  }

  Widget search(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 56.0,
          decoration: BoxDecoration(
              color: DataColors.line2,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(color: DataColors.line)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              Icon(
                Icons.search,
                color: DataColors.five,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "Search",
                style: AppStyles.search(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gridKategori(BuildContext context) {
    return SliverPadding(
      sliver: SliverGrid(
        delegate: SliverChildListDelegate(_buildkategori(context)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }

  _buildkategori(BuildContext context) {
    List<Widget> _list = [];
    for (var i = 0; i < Data.kategori.length; i++) {
      _list.add(
        Card(
          elevation: 0,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: DataColors.line)),
          child: ListTile(
            leading: SvgPicture.asset(Data.kategori[i]["image"]),
            title: Text(
              Data.kategori[i]["nama"],
              style: AppStyles.discriptionItem(context),
            ),
            onLongPress: () {},
          ),
        ),
      );
    }

    return _list;
  }

  Widget nameTag(
    String name,
    BuildContext context, {
    Function xx,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16.0, top: 18.0, bottom: 6.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: AppStyles.headline3(context),
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: DataColors.primer,
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>"$Name Class"));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget listRekomendasi(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 156,
        child: ListView.builder(
            itemCount: Data.rekomendasi.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  width: 356,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CobaUi(
                                    list: Data.rekomendasi[index],
                                  )));
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          Data.rekomendasi[index]["profil"],
                          // color: Colors.black.withOpacity(0.4),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    DataColors.white.withOpacity(0),
                                    DataColors.one.withOpacity(0.5)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.3, 1])),
                        ),
                        Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  Data.rekomendasi[index]["nama"],
                                  style: AppStyles.headline2(context)
                                      .copyWith(color: DataColors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.calendar_today,
                                        size: 20, color: DataColors.white),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      "${Data.rekomendasi[index]["umur"].toString()} Bulan",
                                      style: AppStyles.headline4(context)
                                          .copyWith(color: DataColors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.shopping_basket,
                                        size: 20, color: DataColors.white),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      "${Data.rekomendasi[index]["berat"].toString()} Kg",
                                      style: AppStyles.headline4(context)
                                          .copyWith(color: DataColors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            bottom: 12,
                            left: 12),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }

  Widget listKebutuhan(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
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
    );
  }
}
