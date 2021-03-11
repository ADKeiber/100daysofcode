import 'package:finance_tracker/widgets/adaptive_appbar.dart';
import 'package:finance_tracker/widgets/adaptive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

//Call to run the application
void main() => runApp(MyApp());

//Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //creates the main MaterialApp for the entire program
    return MaterialApp(
      //sets title
      title: 'Personal Expenses',
      //sets theme data where main is purple accent is blue and the error is dark
      //red
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.blue[200],
        errorColor: Colors.red[700],
        //sets main font to be used as imported font "quicksand"
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          //adds opensands font to the theme of the app bar
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
        //adds opensans to be the main font of the entire app
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      ),
      //sets the home widget to MyHomePage stateful widget
      home: MyHomePage(),
    );
  }
}

//Main home widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //method that pops up modal where you can add a new transaction
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  //method where transaction is deleted based on its ID
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  //list filled with transactions that will populate a listview widget
  final List<Transaction> _userTransactions = [];

  //method that takes in a title, cost, and date to create a new transation that
  //will be added to the the _userTransactions list
  void _addNewTransaction(String txTitle, double txCost, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      cost: txCost,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  //bool used with a switch to determine if the chart or list is shown while
  // in landscape mode
  bool _showChart = false;
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //gets the media query of the application
    final mediaQuery = MediaQuery.of(context);
    //stores boolean True if orientation is landscape and false otherwise
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    //adaptive appbar that takes in add new transaction and context of app
    final PreferredSizeWidget appBar =
        AdaptiveAppBar(_startAddNewTransaction, context);

    //creates a widget that is a sized Transaction list view
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    //creates a pagebody that contains a scrollview with a chart, list of transactions
    //and a floating button
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //when in landscape mode generate a switch that either shows
            // the chart or the list of transactions
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show Chart",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,

                    //toggles between chart and list of transactions
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),

            //if in portrait mode adds a chart to the view
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),
            //if in portrait mode adds the list of transactoins to the view
            if (!isLandscape) txListWidget,

            //if in landscape mode determine if chart or list of transactions
            //should be shown depending on the value of _showChart
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget
          ],
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
    //adds an adaptive scaffold that uses the appbar, pagebody, and function
    //that adds a new transaction to list view
    return AdaptiveScaffold(appBar, pageBody, _startAddNewTransaction);
  }
}
