import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$100.00'),
                subtitle: Text('Mateus Henrique')),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$100.00'),
                subtitle: Text('Mateus Henrique')),
          ),
        ],
      ),
    )));
