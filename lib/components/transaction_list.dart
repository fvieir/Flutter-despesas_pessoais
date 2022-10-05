import 'package:flutter/material.dart';
import '../models/trasanctions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList({
    required this.transactions,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.12,
                    child: FittedBox(
                      child: Text(
                        'Sem registros',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text("R\$${tr.value.toStringAsFixed(2)}"),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y', 'pt-BR').format(tr.date),
                    ),
                    trailing: TextButton(
                      onPressed: () => onRemove(tr.id),
                      child: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
