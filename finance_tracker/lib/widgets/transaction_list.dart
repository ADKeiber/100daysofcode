import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  final Function deleteTx;

  TransactionList(this._userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .598,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
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
                      title: Text(
                        _userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd()
                            .format(_userTransactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(_userTransactions[index].id),
                      ),
                    ),
                  );

                  //   Card(
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           child: Text(
                  //             " \$${_userTransactions[index].cost.toStringAsFixed(2)}",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //           ),
                  //           margin: EdgeInsets.symmetric(
                  //             vertical: 10,
                  //             horizontal: 15,
                  //           ),
                  //           decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: Theme.of(context).primaryColor,
                  //               width: 2,
                  //             ),
                  //           ),
                  //           padding: EdgeInsets.all(10),
                  //         ),
                  //         Column(
                  //           children: [
                  //             Text(
                  //               _userTransactions[index].title,
                  //               style: Theme.of(context).textTheme.headline6,
                  //             ),
                  //             Text(
                  //               DateFormat('MM/dd/yyyy')
                  //                   .format(_userTransactions[index].date),
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //           ],
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //         ),
                  //       ],
                  //     ),
                  //   );
                },
                itemCount: _userTransactions.length,
              ),
            ),
    );
  }
}
