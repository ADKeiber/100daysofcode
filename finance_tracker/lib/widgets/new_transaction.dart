import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _submitTrans;

  NewTransaction(this._submitTrans);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            TextButton(
              child: Text(
                "Add transaction",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: () {
                _submitTrans(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
