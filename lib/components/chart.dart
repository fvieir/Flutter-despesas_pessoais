import 'package:expenses/models/trasanctions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransaction;
  Chart({required this.recentTransaction, super.key});

  List<Map<String, Object>> get groupedTransantion {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.day == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransantion;
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const <Widget>[],
      ),
    );
  }
}
