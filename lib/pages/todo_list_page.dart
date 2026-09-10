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
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "Digite seu e-mail"
                ),
                  //onChanged: onChanged,  
                  onSubmitted: onSubmitted,             
              ),
              ElevatedButton(
                onPressed: login, 
                child: Text("Entrar"))
            ],
          ),
        ),
      ),
    );
  }
  void login(){
    String text = emailController.text;
    print("login realizado");
    print(text);
    emailController.clear();
  }

  void onChanged(String text){
    print(text);
  }

  void onSubmitted(String text){
    print(text);
  }
}
