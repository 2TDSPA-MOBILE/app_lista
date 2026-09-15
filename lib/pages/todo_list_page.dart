import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();


class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Ex: Práticar Flutter"
                      ),           
                    ),
                  ),
                  SizedBox(width: 8,),
                  ElevatedButton(
                    onPressed: (){},
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
              ListView(
                shrinkWrap: true,
                children: [
                    Text("Prof. Fernando"),
                    ElevatedButton(
                      onPressed:(){}, child: Text("Pressione")),
                    Icon(Icons.person,size: 50,),
                    AppBar(
                      title: Text("Sou app bar"),
                      
                    )
                  ,
                  Container(
                    height: 50,
                    width: 300,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    color: Colors.yellow,
                  ),
                   Container(
                    height: 50,
                    width: 300,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    color: Colors.purple,
                  )

                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Você possui 0 tarefas pendentes")),
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
    );
  }
  
}
