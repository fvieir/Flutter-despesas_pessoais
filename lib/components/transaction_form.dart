import 'package:expenses/components/date/adaptative_date_picker.dart';
import 'package:expenses/components/text_field/adaptative_text_field.dart';
import 'package:flutter/material.dart';
import 'buttons/adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm({required this.onSubmit, super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final textController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? _selectDate;

  _submitForm() {
    final title = textController.text;
    final value = double.tryParse(valueController.text) ?? 0;
    DateTime? date = _selectDate;

    if (title.isEmpty || value <= 0 || date == null) return;

    widget.onSubmit(title, value, date);
  }

  void onSetState(DateTime newDate) {
    setState(() {
      _selectDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: textController,
                onSubmitted: (_) => _submitForm(),
                label: 'Título',
              ),
              AdaptativeTextField(
                controller: valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                label: 'Valor R\$:',
              ),
              AdaptativeDatePicker(
                selectDate: _selectDate,
                onDateChanged: onSetState,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
