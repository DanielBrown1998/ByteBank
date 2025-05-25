import 'package:app/models/transaction.dart';
import 'package:app/screens/components/transfer_card.dart';
import 'package:app/services/transactions_services.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TransactionService transactionService = TransactionService();

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

      body: FutureBuilder(
        future: transactionService.getTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final transactions = snapshot.data as List<Transaction>;
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransferCard(transaction: transactions[index]);
              },
            );
          }
        },
      ),
    );
  }
}
