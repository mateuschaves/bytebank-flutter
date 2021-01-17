import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            TextField(
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Pra quem deseja transferir ?',
                hintText: 'Ex. Mateus Henrique',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  labelText: 'Quanto deseja transferir ?',
                  hintText: 'R\$ 10.00',
                  icon: Icon(Icons.monetization_on)),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text('Transferir'),
            ),
          ])),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(
            nome: 'Mateus Henrique',
            valor: 'R\$ 100',
          ),
          ItemTransferencia(
            nome: 'Isabela Simões',
            valor: 'R\$ 20.000',
          ),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  ItemTransferencia({
    @required this.valor,
    @required this.nome,
  });

  final String valor;
  final String nome;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(valor),
          subtitle: Text(nome)),
    );
  }
}
