import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var lista = [];

  @override
  void initState() {
    super.initState();
  }

  Future buscarDados() async {
    var url = 'http://localhost:1337/clientes';

    await http.get(url).then((value) => {
          setState(() {
            lista = (jsonDecode(value.body)["data"] as List)
                .map((e) => e as Map<String, dynamic>)
                ?.toList();
          })
        });
  }

  Widget construirCard(
      {String nome, String endereco, String telefone, dynamic saldo}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.all(5),
        child: Container(
          color: Colors.blue[100],
          child: ListTile(
            leading: Icon(
              Icons.face,
              size: 50,
            ),
            title: Text(
              nome,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Text(
              saldo.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: saldo > 0 ? Colors.green : Colors.red,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(endereco),
                SizedBox(
                  height: 15,
                ),
                Text(
                  telefone,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AGIOTLIST',
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: buscarDados(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return construirCard(
                    nome: lista[index]['nome'],
                    endereco: lista[index]['endereco'],
                    telefone: lista[index]['telefone'],
                    saldo: lista[index]['saldo']);
              },
            );
          },
        )

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
