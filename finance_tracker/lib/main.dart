import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: "New shoes",
      cost: 45.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "Socks",
      cost: 10.01,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: [
            Card(
              child: Container(
                child: Text("Chart!"),
                width: double.infinity,
                color: Colors.blue,
              ),
              elevation: 5,
            ),
            Card(
              color: Colors.green,
              child: Text("List of Tx"),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
