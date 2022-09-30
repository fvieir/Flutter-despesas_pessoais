import 'package:flutter/material.dart';
import '../models/trasanctions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tr = transactions[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple.shade100,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      DateFormat('d MMM y', 'pt-BR').format(tr.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
