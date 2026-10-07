import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_lista/models/tarefa.dart';
import 'dart:convert';

const tarefaListKey = "lista_tarefas";

class TarefaRepository {
  //Construtor da classe
  //A operação para obter o sharepreferences é assíncrono

  TarefaRepository(){
    SharedPreferences.getInstance().then((value)=>sharedPreferences=value);
  }
  //late significa que a variável será inicializada posteriormente,
  //dentro do processo assíncrono do construtor
  late SharedPreferences sharedPreferences;

   //Método para buscar as tarefas salvas
  Future<List<Tarefa>>getListaTarefas()async{
    print("Entra aq");
    sharedPreferences = await SharedPreferences.getInstance();

    final String jsonString = sharedPreferences.getString(tarefaListKey)??"[]";
    
    final List jsonDecoded = json.decode(jsonString) as List;
    
    return jsonDecoded.map((e)=>Tarefa.fromJson(e)).toList();

  }

  void saveTarefaList(List<Tarefa>tarefas){
      //Converte a lista de objetos para um String no formato JSON
      //jsonEcode recebe uma lista de tarefas e transforma seus dados em uma representação
      //que pode ser armazenada
      final jsonString = json.encode(tarefas);

      //Salvando no shared preferences
      sharedPreferences.setString("lista_tarefas", jsonString);
      print(jsonString);
  }

 
}