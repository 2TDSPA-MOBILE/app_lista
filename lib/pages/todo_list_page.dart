import 'package:app_lista/models/tarefa.dart';
import 'package:app_lista/repositories/tarefa_repository.dart';
import 'package:flutter/material.dart';
import "package:app_lista/widgets/tarefa_list_item.dart";


final TarefaRepository tarefaRepository = TarefaRepository();
final TextEditingController tarefaController = TextEditingController();

List<Tarefa> listTarefas = [];
Tarefa? deletedTarefa;
int? deletedTarefaPos;
String? errorText;

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState(){
    super.initState();
    tarefaRepository.getListaTarefas().then((value){
      setState(() {
        listTarefas=value;
      });
    });
  }

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
                          hintText: "Ex: Práticar Flutter",
                          errorText: errorText
                        ),           
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: (){
                        String text = tarefaController.text;
                        if(text.isEmpty){
                          setState(() {
                            errorText = "O campo não pode ser vazio";
                          });
                         return;
                        }
                        setState(() {
                          //Criando um objeto tarefa
                          Tarefa newTarefa = Tarefa(
                              titulo: text,
                              dateTime: DateTime.now()
                          );
                          listTarefas.add(newTarefa);
                          errorText = null;
                        });       
                        //Enviar a lista atualizada para o repository
                        tarefaRepository.saveTarefaList(listTarefas);               
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
                          onDelete:onDelete
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
                      onPressed: showDeleteTarefasCorfimationDialog,
                      child: Text("Limpar Tudo.",style:TextStyle(color:Colors.white)))
                  ],
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(
                      context, 
                      "/configuracoes",
                      arguments: "Olá, Aluno!"
                    );               
                  }, 
                  child: Text("Configurações"))
                  ,
                  ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(
                      context,
                      "/perfil"
                    );             
                  }, 
                  child: Text("Perfil")),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(
                        context, 
                        "/sobre");
                    }, 
                    child: Text("Ir para tela Sobre")
                  )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onDelete(Tarefa tarefa){
    deletedTarefa = tarefa;
    deletedTarefaPos = listTarefas.indexOf(tarefa);

    setState(() {
       listTarefas.remove(tarefa);
    });
    tarefaRepository.saveTarefaList(listTarefas);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text("Tarefa ${tarefa.titulo} foi deletada!",
          style: TextStyle(color:Colors.black),
      ),
       backgroundColor: Colors.white,
       action: SnackBarAction(
        label: "Desfazer", 
        textColor: Colors.red,
        onPressed: (){
          setState(() {
            listTarefas.insert(deletedTarefaPos!, deletedTarefa!);
          });
          tarefaRepository.saveTarefaList(listTarefas);
        }
      ),
      )
      );     
  }
  void showDeleteTarefasCorfimationDialog(){
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Limpar tudo?"),
        content: Text("Tem certeza que deseja excluir todas as tarefa?"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("Cancelar")
            ),
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              deleteTodasTarefas();
            },
            child: Text("Limpar Tudo"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red
            ),
          )
        ],
      )
    );
  }
  void deleteTodasTarefas(){
    setState(() {
       listTarefas.clear();//Limpa a lista de tarefas
    //por completo.
    });   
    tarefaRepository.saveTarefaList(listTarefas);
  }
}
