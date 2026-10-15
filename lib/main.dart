import 'package:flutter/material.dart';
import 'package:app_lista/pages/todo_list_page.dart';
import 'package:app_lista/pages/configuracoes_page.dart';
import 'package:app_lista/pages/home_page.dart';
import 'package:app_lista/pages/home_page2.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage2(),
    );
  }
}

