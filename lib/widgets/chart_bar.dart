import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double dayAmount;
  final String day;
  final double spendingPercTotal;

  ChartBar({this.day, this.dayAmount, this.spendingPercTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18,
          child: FittedBox(child: Text("\$${dayAmount}")),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              // Container(
              //   height: 60 * spendingPercTotal,
              //   width: 10,
              //   color: Colors.purple,
              // )
              FractionallySizedBox(
                heightFactor: 1 - spendingPercTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: spendingPercTotal == 0
                        ? BorderRadius.circular(10)
                        : BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Stack(
        //   children: [
        //     Container(
        //       height: 60,
        //       width: 50,
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.grey, width: 1.0),
        //         borderRadius: BorderRadius.circular(10),
        //         color: Color.fromRGBO(220, 220, 220, 1),
        //       ),
        //     ),
        //     FractionallySizedBox(
        //       heightFactor: spendingPercTotal,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Theme.of(context).primaryColor,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        SizedBox(
          height: 10,
        ),
        Text(day),
      ],
    );
  }
}
