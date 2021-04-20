import 'package:cyferscript/about_page.dart';
import 'package:cyferscript/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/#/': (_) => HomePage(),
        '/#/about/': (_) => AboutPage(),
      },
      home: HomePage(),
    );
  }
}
