import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final textController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor R\$:',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  onPressed: () {
                    final title = textController.text;
                    final value = double.tryParse(valueController.text) ?? 0;
                    onSubmit(title, value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
