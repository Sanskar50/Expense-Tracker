import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function NewTrans;
  final VoidCallback delAll;

  NewTransaction(this.NewTrans, this.delAll);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlectrl = TextEditingController();

  final amountctrl = TextEditingController();

  DateTime date = DateTime.now();

  void submitTrans() {
    final enteredTitle = titlectrl.text;
    final enteredAmount = double.parse(amountctrl.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.NewTrans(titlectrl.text, double.parse(amountctrl.text), date);

    Navigator.of(context)
        .pop(); // to close the modal bottom sheet after submitting the data
  }

  void _DatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        date = pickedDate;
      });
    });
    print("...");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            //onChanged: (val) => Inputtitle = val,
            controller: titlectrl,
            onSubmitted: (_) => submitTrans(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            //onChanged: (val) => Inputamount = val,
            controller: amountctrl,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitTrans(),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Picked Date: ${DateFormat.yMd().format(date)}',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _DatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                child: Text('Clear All'),
                onPressed: () {
                  widget.delAll();
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 172,
              ),
              ElevatedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Quicksand'),
                ),
                onPressed: submitTrans,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
