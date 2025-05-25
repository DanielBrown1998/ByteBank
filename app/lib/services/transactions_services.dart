import 'dart:convert';

import 'package:app/models/transaction.dart';
import 'package:app/services/access.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<List<Transaction>> getTransactions() async {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> addTransaction(Transaction transaction) async {
    List<Transaction> transactions = await getTransactions();

    if (transactions.any(
      (t) => t.name == transaction.name && t.value == transaction.value,
    )) {
      print("Transaction already exists");
      return;
    }
    if (transaction.name.isEmpty || transaction.value <= 0) {
      print("Invalid transaction data");
      return;
    }

    transactions.add(transaction);
    List<Map<String, dynamic>> jsonTransactions =
        transactions.map((toElement) => toElement.toJson()).toList();

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $password',
      },
      body: json.encode(jsonTransactions),
    );

    if (response.statusCode != 201) {
      print('Failed to add transaction');
    } else if (response.statusCode == 201) {
      print("Transaction added successfully");
    }
  }
}
