import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/utils/hive_manager.dart';
import 'package:test_sru/utils/injector.dart';
import 'package:test_sru/views/main_navigation_view.dart';

import 'utils/main_route_observer.dart';

Future<void> main() async {
  Injector.setUp();
  await HiveManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [MainRouteObserver()],
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        )
      ),
      home: MainNavigationView(),
    );
  }
}