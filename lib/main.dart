
import 'package:cotacao_btc/app/controllers/theme_controller.dart';
import 'package:cotacao_btc/app/screens/list_currencies_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/screens/login_screen.dart';
import 'controllerBinding.dart';

void main() {

  ControllerBinding().dependencies();

  // Get.lazyPut<HomeController>(() => HomeController());
  // Get.lazyPut<ListCurrenciesController>(() => ListCurrenciesController());
  // Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent[100],
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ListCurrencies(),
      // home: LoginScreen(),
    );
  }
}

