//Importa os componentes visuais do Flutter...
import 'package:flutter/material.dart';

import 'package:app_lista/pages/todo_list_page.dart';
import 'package:app_lista/pages/configuracoes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variável será responsável por controlar a aba que está selecionada.
  //todo_list_page será representada pelo valor 0
  //configuracoes_page será representada pelo valor 1
  int curruntIndex = 0;

  //Lista contendo todas as páginas.
  final List<Widget> pages = [
    const TodoListPage(),
    const ConfiguracoesPage()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curruntIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: curruntIndex,
        onDestinationSelected: (index){
          setState(() {
            curruntIndex=index;
          });
        },
        destinations: const[
          NavigationDestination(
            icon: Icon(Icons.list), 
            label: "Tarefas"),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Configurações")
        ],
      )
    );
  }
}