import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function submitTrans;

  NewTransaction(this.submitTrans);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.submitTrans(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text("No Date Chosen!"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choose Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                  child: TextButton(
                    child: Text(
                      "Add transaction",
                      style: TextStyle(
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                    onPressed: submitData,
                  ),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}


// TextButton(
//                     child: Text(
//                       "Add transaction",
//                       style: TextStyle(
//                         color: Colors.purple,
//                       ),
//                     ),
//                     onPressed: submitData,
//                   ),
