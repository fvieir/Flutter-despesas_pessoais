import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/trasanctions.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    final _transactions = [
      Transaction(
        id: 't1',
        title: 'Novo tênis Adidas',
        value: 370.76,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Conta de água',
        value: 70.3,
        date: DateTime.now(),
      ),
    ];

    _addTransaction(String title, double value) {
      final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now(),
      );

      setState(() {
        _transactions.add(newTransaction);
      });
    }

    return Column(
      children: [
        TransactionList(
          transactions: _transactions,
        ),
        TransactionForm(
          onSubmit: _addTransaction,
        ),
      ],
    );
  }
}
