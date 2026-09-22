import 'package:app_lista/models/tarefa.dart';
import 'package:flutter/material.dart';
import "package:app_lista/widgets/tarefa_list_item.dart";

final TextEditingController tarefaController = TextEditingController();

List<Tarefa> listTarefas = [];

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: tarefaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione uma tarefa",
                          hintText: "Ex: Práticar Flutter"
                        ),           
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: (){
                        String text = tarefaController.text;
                        setState(() {
                          //Criando um objeto tarefa
                          Tarefa newTarefa = Tarefa(
                              titulo: text,
                              dateTime: DateTime.now()
                          );
                          listTarefas.add(newTarefa);
                        });                      
                        tarefaController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7a1111),
                        padding: EdgeInsets.zero
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color:Colors.white
                      )
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Tarefa tarefa in listTarefas)
                        TarefaListItem(
                          tarefa: tarefa,
                        )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Text("Você possui ${listTarefas.length} tarefas pendentes")),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7a1111)),                      
                      onPressed: (){},
                      child: Text("Limpar Tudo.",style:TextStyle(color:Colors.white)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
