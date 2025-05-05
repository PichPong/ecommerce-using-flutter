import 'package:app_ecommerce/pages/CartPage.dart';
import 'package:app_ecommerce/pages/Homepage.dart';
import 'package:app_ecommerce/pages/ItemPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/" : (context) => HomePage(),
        "/itemPage" : (context) => ItemPage(),
        "/cartPage" : (context) => CartPage(),
      },
    );
  }
}
