import 'package:flutter/material.dart';

import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/pages/avatar_page.dart';
import 'package:flutter_widgets/src/pages/card_page.dart';
// import 'package:flutter_widgets/src/pages/home_temp.dart';
import 'package:flutter_widgets/src/pages/home_pages.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    'avatar' : (BuildContext context) => AvatarPage(),
    'card' : (BuildContext context) => CardPage(),
  };
}