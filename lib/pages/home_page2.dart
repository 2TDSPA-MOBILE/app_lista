import 'package:flutter/material.dart';
import 'package:app_lista/pages/todo_list_page.dart';
import 'package:app_lista/pages/configuracoes_page.dart';
import 'package:app_lista/pages/about_page.dart';
import 'package:app_lista/pages/profile_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int curruntIndex = 0;

  //Lista contendo todas as páginas.
  final List<Widget> pages = [
    const TodoListPage(),
    const ConfiguracoesPage(),
    const AboutPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sou a App Bar"),
      ),
      body: pages[curruntIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.list),
              title:Text("Tarefas"),
              onTap: (){
                setState(() {
                  curruntIndex = 0;
                });
                Navigator.pop(context);                
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configurações"),
              onTap: (){
                setState(() {
                  curruntIndex = 1;
                });
                Navigator.pop(context);
              },             
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Sobre"),
              onTap: (){
                setState(() {
                  curruntIndex = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}