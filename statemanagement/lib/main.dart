import 'package:flutter/material.dart';
import 'package:statemanagement/views/shopping_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingPage(),
    );
  }
}
