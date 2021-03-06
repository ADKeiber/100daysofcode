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
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          tx.cost.toString(),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: [
                          Text(tx.title),
                          Text(
                            tx.date.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
