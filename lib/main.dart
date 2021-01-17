import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class Transaction {
  final double price;
  final String name;

  Transaction({this.price, this.name});

  toString() {
    debugPrint('Transaction{price: $price, name: $name}');
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();

  createTransaction(context) {
    final String name = _controllerName.text;
    final double price = double.tryParse(_controllerPrice.text);

    final Transaction transaction = Transaction(
      name: name,
      price: price,
    );

    Navigator.pop(context, transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Editor(
              controller: _controllerName,
              hint: 'Ex. Mateus Henrique',
              label: 'Pra quem deseja transferir ?',
              keyboardType: TextInputType.name,
            ),
            Editor(
              controller: _controllerPrice,
              hint: 'Ex. R\$ 100,00',
              label: 'Quanto deseja transferir ?',
              keyboardType: TextInputType.number,
              icon: Icon(Icons.monetization_on),
            ),
            RaisedButton(
              child: Text('Transferir'),
              onPressed: () => createTransaction(context),
            ),
          ])),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Icon icon;
  final TextInputType keyboardType;

  Editor({
    this.controller,
    this.hint,
    this.label,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        icon: icon,
      ),
      keyboardType: keyboardType,
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
        onPressed: () {
          final Future<Transaction> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );

          future.then((transactionReceived) {
            debugPrint(transactionReceived.toString());
          });
        },
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
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(valor),
          subtitle: Text(nome)),
    );
  }
}
