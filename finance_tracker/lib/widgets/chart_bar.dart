import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //contains all the information for each bar in the chart
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingPercentOfTotal});

  @override
  Widget build(BuildContext context) {
    //layoutbuilder has the ability to detect heights
    return LayoutBuilder(
      builder: (ctx, contraints) {
        return Column(
          children: [
            //contains the spending amount for that day
            Container(
              height: contraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${spendingAmount.toStringAsFixed(0)}',
                ),
              ),
            ),
            //spacing box
            SizedBox(
              height: contraints.maxHeight * 0.05,
            ),
            //contains the actual bar itself with percentage spent that day
            //compared to the entire week
            Container(
              height: contraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //contains the "fill" of the bar representing the percentage
                  FractionallySizedBox(
                    heightFactor: spendingPercentOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //spacer
            SizedBox(
              height: contraints.maxHeight * 0.05,
            ),
            //contains the first 3 letters for that day
            Container(
              height: contraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
