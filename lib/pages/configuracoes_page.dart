import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  //final String? textoRecebido;

  //O construtor que recebe o texto
  const ConfiguracoesPage({
    super.key,
    //this.textoRecebido 
  });

  @override
  Widget build(BuildContext context) {
    final String textoRecebido = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Essa é a tela de configuração."),
          ),
          Text(textoRecebido)
          ,
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