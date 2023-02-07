import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountInputController = TextEditingController();
  final _titleInputController = TextEditingController();

  DateTime _selectedDate;

  void _submitTransaction() {
    final enteredTitle = _titleInputController.text;
    final enteredAmount = double.parse(_amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null)
        return;
      else
        setState(() {
          _selectedDate = pickedDate;
        });
    });
    print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: _titleInputController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: _amountInputController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitTransaction(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? "No Date Chosen!"
                    : "Picked date: ${DateFormat.yMd().format(_selectedDate)}",
              ),
              TextButton(
                onPressed: _presentDatePicker,
                child: Text(
                  "Choose Date",
                  style: kTextStyleChooseDateButton,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).textTheme.labelLarge.color),
              ),
              onPressed: () => _submitTransaction(),
              child: Text("Add Transaction"),
            ),
          )
        ],
      ),
    );
  }
}
