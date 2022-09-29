import 'package:expenses/models/trasanctions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Expenses());

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        value: 70.35,
        date: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.purple,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Text(tr.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
