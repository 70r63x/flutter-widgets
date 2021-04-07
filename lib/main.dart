import 'package:flutter/material.dart';

// import 'package:flutter_widgets/src/pages/home_temp.dart';
import 'package:flutter_widgets/src/pages/home_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage()
    );
  }
}