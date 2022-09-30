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
    final List<Transaction> _transactions = [
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

    return Column(
      children: [
        TransactionList(
          transactions: _transactions,
        ),
        TransactionForm(),
      ],
    );
  }
}
