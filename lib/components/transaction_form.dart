import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(
    this.onSubmit,
  );

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Value (R\$)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('New Transaction'),
                textColor: Colors.purple,
                onPressed: _submitForm,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
