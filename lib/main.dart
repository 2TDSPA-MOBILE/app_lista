import 'package:app_lista/pages/about_page.dart';
import 'package:app_lista/pages/profile_page.dart';
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
      routes: {
        //Definindo a tela inicial do app
        "/":(context)=> const TodoListPage(),
        //Nomeando a rota de tela(configurações)
        "/configuracoes":(context)=>const ConfiguracoesPage(),
        //Nomeando a rota de tela(profile)
        "/perfil":(context)=>const ProfilePage(),
        //Nomeando a rota de tela(sobre)
        "/sobre":(context)=>const AboutPage()
      },
    );
  }
}

