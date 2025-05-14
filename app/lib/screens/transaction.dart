import 'package:app/screens/components/transfer_card.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  //TODO create a table in bd
  List<TransferCard> list = [
    TransferCard(value: "234,43", account: 21),
    TransferCard(value: "499,90", account: 5),
    TransferCard(value: "523,32", account: 1),
    TransferCard(value: "26", account: 2),
    TransferCard(value: "324,13", account: 6),
    TransferCard(value: "200", account: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Transactions",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      //TODO: refactor with FutureBuilder

      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return list[index];
        },
      ),
    );
  }
}
