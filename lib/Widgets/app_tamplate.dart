import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider_http_req/Services/Network/networkSensitive.dart';
import 'package:provider_http_req/Util/Colors.dart';
import 'package:provider_http_req/Util/Text_Styles.dart';
import 'package:provider_http_req/Util/size_config.dart';
import 'package:provider_http_req/Widgets/devider_tamplate.dart';

class DraftBar extends StatefulWidget {
  final Widget text;
  final Widget body;
  final Widget floating;

  final List<Widget> action;
  final Key scaffoldKey;
  final bool appBar;
  final bool appBarBackArrow;
  final bool appBarDevider;

  DraftBar(
      {@required this.body,
      this.floating,
      this.text,
      this.action,
      this.scaffoldKey,
      this.appBar = true,
      this.appBarBackArrow = false,
      this.appBarDevider = true});
  @override
  _DraftBarState createState() => _DraftBarState();
}

class _DraftBarState extends State<DraftBar> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  NeteworkService neteworkService = NeteworkService(); //service bloc

  @override
  void dispose() {
    neteworkService.dispose();
    super.dispose();
  }

  void setBottomSheet(BuildContext context) {
    globalKey.currentState
      ..showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          "Tidak Ada sambungan Internet",
          textAlign: TextAlign.center,
          style: AppStyles.subhead(context).copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: globalKey,
      appBar: widget.appBar
          ? AppBar(
              automaticallyImplyLeading: false,
              leading: widget.appBarBackArrow
                  ? IconButton(
                      icon: Icon(Icons.arrow_back, color: DataColors.one),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                  : null,
              elevation: 0,
              bottom: widget.appBarDevider ? DividerTamplate() : null,
              backgroundColor: Colors.transparent,
              title: widget.text ?? null,
              actions: widget.action ?? null)
          : null,
      body: SafeArea(
        child: StreamBuilder<ConnectivityResult>(
          stream: neteworkService.stateStream,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot.data == ConnectivityResult.none) {
              //Untuk mengatasi eror setState() or markNeedsBuild() called during build
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setBottomSheet(context);
              });
            }
            print("Status Connectivity => ${snapshot.data.toString()}");
            return widget.body;
          },
        ),
      ),
      floatingActionButton: widget.floating ?? null,
    );
  }
}
