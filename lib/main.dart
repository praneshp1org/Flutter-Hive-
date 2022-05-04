import 'package:flutter/material.dart';
import 'package:hive_demo/models/person.dart';
import 'package:hive_demo/screens/add_screen.dart';
import 'package:hive_demo/screens/dashboard.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/info_screen.dart';
import 'package:get/get.dart';

main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(PersonAdapter());
  // Opening the box
  await Hive.openBox('peopleBox');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // accentColor: Colors.blue,
      ),

      debugShowCheckedModeBanner: false,
      // home: InfoScreen(),
      getPages: [
        GetPage(name: "/", page: () => Dashboard()),
        GetPage(name: "/info", page: () => InfoScreen()),
        GetPage(name: "/add", page: () => AddScreen()),
      ],
    );
  }
}
