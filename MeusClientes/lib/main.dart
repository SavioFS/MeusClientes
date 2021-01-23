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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
        "saldo": 2000,
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
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: Colors.blue[50],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: Colors.blue[50],
            ),
          ),
        ],
      ),

      /*ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Text(lista[index]['nome']);
        },
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
