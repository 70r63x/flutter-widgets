import 'package:flutter/material.dart';

import 'package:flutter_widgets/src/routes/routes.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('Ruta llamada ${settings.name}');

        return MaterialPageRoute(
            builder: (context)=> AlertPage()
          );
      },
    );
  }
}