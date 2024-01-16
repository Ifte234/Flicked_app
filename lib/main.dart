import 'package:flicked_app/Pages/MainPage.dart';
import 'package:flicked_app/Pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(SplashPage(key:UniqueKey(), onInitializationComplete: ()=>runApp(ProviderScope(child: MyApp()))),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        title: Text("Flicked"),
      ),
      initialRoute: 'home',
      routes:{'home' : (BuildContext _context) => MainPage(),}
    );
  }
}
