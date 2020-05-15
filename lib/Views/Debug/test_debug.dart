import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';

class TestDebug extends StatelessWidget {
  final String name;

  const TestDebug({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            "Route $name Salah",
            style: Theme.of(context).textTheme.body1,
          ),
        ),
        // child: ListTile(
        //   title: Text("Grepe-Grepe"),
        //   leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
        //   trailing: Text("Grepe-Grepe"),
        //   subtitle: Text(
        //       "ahdkjahdauiaskjbakjsbfkjabsjfbkjabjkfbasbjfkbjakbfkjbjkabfkjbkjabfkjasbjkjfasjdnaskjdadkjaskjahdkjahdauiaskjbakjsbfkjabsjfbkjabjkfbasbjfkbjakbfkjbjkabfkjbkjabfkjasbjkjfasjdnaskjdadkjaskjahdkjahdauiaskjbakjsbfkjabsjfbkjabjkfbasbjfkbjakbfkjbjkabfkjbkjabfkjasbjkjfasjdnaskjdadkjaskjahdkjahdauiaskjbakjsbfkjabsjfbkjabjkfbasbjfkbjakbfkjbjkabfkjbkjabfkjasbjkjfasjdnaskjdadkjaskj"),
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: DataColors.primer,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.green,
                ),
                title: Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment_ind,
                  color: Colors.green[400],
                ),
                title: Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(
                icon: ClipOval(
                  child: Container(
                    height: 52,
                    width: 52,
                    color: DataColors.alert,
                    child: Center(child: Icon(Icons.add, color: Colors.white)),
                  ),
                ),
                title: Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment_ind,
                  color: Colors.green[400],
                ),
                title: Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.greenAccent[700],
                ),
                title: Padding(padding: EdgeInsets.all(0))),
          ]),
    );
  }
}
