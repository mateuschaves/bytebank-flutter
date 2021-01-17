import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: ListaTransferencia(),
    )));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
