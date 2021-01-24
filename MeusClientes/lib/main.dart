import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgioList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Lista de Clientes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                fontWeight: FontWeight.bold, fontSize: 18,
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
    var lista = [
      {
        "id": 12,
        "nome": "Sílvia Maria Borges Dias",
        "telefone": "62994943490",
        "endereco":
            "Rua das Garças quadra 16 Lote 29 Colina Azul\n\nproximo ao colegio Militar no Colina Azul",
        "saldo": -2000,
        "created_at": "2021-01-23T21:45:22.000Z",
        "updated_at": "2021-01-23T21:45:22.000Z"
      },
      {
        "id": 11,
        "nome": "Savio Ferreira de Souza",
        "telefone": "62986265578",
        "endereco":
            "rua 30 quadra 53 lote 01 bairro independência  \n\nproximo a drogaria MedFacil ",
        "saldo": 200,
        "created_at": "2021-01-23T21:36:34.000Z",
        "updated_at": "2021-01-23T21:36:34.000Z"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AGIOTLIST',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return construirCard(
              nome: lista[index]['nome'],
              endereco: lista[index]['endereco'],
              telefone: lista[index]['telefone'],
              saldo: lista[index]['saldo']);
        },
      ),
      
      /*Column(
        children: [
          construirCard(
              nome: lista[0]['nome'],
              endereco: lista[0]['endereco'],
              telefone: lista[0]['telefone'],
              saldo: lista[0]['saldo']),
          construirCard(
              nome: lista[1]['nome'],
              endereco: lista[1]['endereco'],
              telefone: lista[1]['telefone'],
              saldo: lista[1]['saldo']),
        ],
      ),*/

      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
