import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trasanctions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
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
          trailing: MediaQuery.of(context).size.width > 480
              ? TextButton.icon(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                    size: 30,
                  ),
                  label: Text(
                    'Excluir',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : IconButton(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                ),
        ),
      ),
    );
  }
}
