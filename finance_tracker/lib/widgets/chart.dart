import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  //shows transactions that were during this last week
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  //gets a list of the last week including the total amount
  //and day in which the transactions occured
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].cost;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 3),
        "cost": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item["cost"];
    });
  }

  @override
  Widget build(BuildContext context) {
    //contains entire chart
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          //spaces out all of the week days to fill the card
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              //contains each bar and has entire amount spent that day and
              //the first 3 letters to represent the day
              child: ChartBar(
                label: data["day"],
                spendingAmount: data["cost"],
                spendingPercentOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data["cost"] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
