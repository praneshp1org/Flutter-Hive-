import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_demo/Widgets/dash_widget.dart';
import 'package:hive_demo/screens/info_screen.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Pranesh Shrestha'),
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ],
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/80845871?v=4",
                  ),
                ),
                accountEmail: Text("i.will.learn.flutter@gmail.com")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    (_isLight == false)
                        ? Get.changeTheme(ThemeData.light())
                        : Get.changeTheme(ThemeData.dark());
                  });
                  _isLight = !_isLight;
                },
                child: ListTile(
                  title: Text("Change Theme"),
                  leading: Icon(Icons.wb_sunny),
                  trailing: Chip(
                      label: (_isLight == true)
                          ? Text('Light theme')
                          : Text('Dark theme')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(InfoScreen());
                },
                child: ListTile(
                  title: Text("Todo List"),
                  leading: Icon(Icons.check),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text("Offline mode"), leading: Icon(Icons.wifi_off)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("Notifications"),
                leading: Icon(Icons.notifications_active),
                trailing: Chip(label: Text('3')),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      title: Text("Quit app"),
                      leading: Icon(Icons.do_disturb_on_rounded)),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('DASHBOARD'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.notification_important),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.account_circle),
            ]),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/info');
                      },
                      child: Dash(title: "TODO LIST", image: "images/t.png")),
                  Dash(title: "AGENDAS", image: "images/target.png"),
                  Dash(title: "SETTINGS", image: "images/s.png"),
                  Dash(title: "VISUALIZE", image: "images/abstract.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
