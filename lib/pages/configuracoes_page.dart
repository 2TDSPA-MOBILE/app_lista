import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Essa é a tela de configuração."),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Voltar")
          )
        ],
      ),
    );
  }
}