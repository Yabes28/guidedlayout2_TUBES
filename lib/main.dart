import 'package:flutter/material.dart';

import 'package:guidedlayout2_1748/View/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: WelcomeView(),
    );
  }
}