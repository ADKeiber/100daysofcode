import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  //list that contains all user transactions
  final List<Transaction> _userTransactions;

  //function used to delete a transaction from user transactions
  final Function deleteTx;

  //constructor
  TransactionList(this._userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    //conditional to determine if there are any user transactions. If there isn't
    //any then they would display no list but would otherwise
    return _userTransactions.isEmpty

        //returns a Layoutbuilder with text saying no transactions and an image
        //of sleeping Z's because there is nothing exciting happeneing
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No Transactions",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        //List for displaying user transactions wrapped in a notification
        //listener where overscroll glow is deactivated
        : NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    //contains amount for transaction
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            "\$${_userTransactions[index].cost}",
                          ),
                        ),
                      ),
                    ),
                    //contains the name of the transaction
                    title: Text(
                      _userTransactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    //text below main text that contains the date of the transaciton
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransactions[index].date),
                    ),
                    //icon used to delete transaction
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(_userTransactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
          );
  }
}
