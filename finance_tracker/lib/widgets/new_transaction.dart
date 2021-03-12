import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

import './adaptive_button.dart';

// widget used as a modal that allows for the user to create a new transaction
class NewTransaction extends StatefulWidget {
  //function used to submit a new transaction
  final Function submitTrans;

  NewTransaction(this.submitTrans);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //text controller that takes a user inputed title and amount for a transaction
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //Variables used to store a date and is originally set to the current day
  DateTime _selectedDate = DateTime.now();

  //function that takes the title controller and amountcontroller and
  //adds them to transactions and closes the modal
  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.submitTrans(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    //closes modal
    Navigator.of(context).pop();
  }

  //function that allows for user to pick a date the transaction occured
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          _selectedDate = date;
        });
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    //notification listener turns off web glow
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      //scroll view that allows for modal to not be covered up by keyboard
      child: SingleChildScrollView(
        child: Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              children: [
                //contains Title information for new transaction
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                //contains amount/cost information for new transaction
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                //contains date picker that is fisrt set to todays date but
                //can be updated by the user using a date picker
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Date:   ${DateFormat.yMd().format(_selectedDate)}",
                        ),
                      ),
                      AdaptiveButton("Choose Date", _presentDatePicker)
                    ],
                  ),
                ),
                //button used to add transaction
                //shadowing for text button
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 40.0,
                    margin: const EdgeInsets.only(
                      bottom: 6.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    //actual text button construction
                    child: TextButton(
                      child: Text(
                        "Add transaction",
                        style: TextStyle(
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      onPressed: _submitData,
                    ),
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ),
      ),
    );
  }
}
