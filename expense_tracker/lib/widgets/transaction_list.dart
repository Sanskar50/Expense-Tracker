import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userT;
  final Function _delTrans;

  TransactionList(this.userT, this._delTrans);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      child: userT.isEmpty
          ? Column(
              children: [
                Text('No Transactions ',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting2.png',
                        fit: BoxFit.cover)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text('\"An app by MR SS\"',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\₨${userT[index].amount}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        userT[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(userT[index].date),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => _delTrans(userT[index].id))),
                );
              },
              itemCount: userT.length,
            ),
    );
  }
}
