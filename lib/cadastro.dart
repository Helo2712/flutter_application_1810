import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1810/aluno.dart';
import 'package:http/http.dart' as http;


class Mycadastro extends StatefulWidget {
  const Mycadastro({super.key});

  @override
  State<Mycadastro> createState() => _MycadastroState();
}

class _MycadastroState extends State<Mycadastro> {
  TextEditingController raController = TextEditingController();
  TextEditingController nomeController =  TextEditingController();
  Aluno al = Aluno();
  Future<void> cadastrar () async{
    var url = Uri.parse('http://localhost:8080/Apidemo/inserir');
     print(al.nome);
               print(al.ra.toString());
    await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8' },
      body:jsonEncode(
        {
        "ra": al.ra,
        "nome": al.nome
        }
      )
    );
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar( title: Text("Testando metodo POST"),),
      body:  Container(
        child: Column(
          children: [
            TextField(
              controller: raController,
              decoration: InputDecoration(labelText: "ra"),
            ),
             TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "nome"),
            ),
            ElevatedButton(onPressed: (){
              al.ra = int.parse(raController.text);
              al.nome = nomeController.text;
              print(al.nome);
               print(al.ra.toString());
              cadastrar();
            }, child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}