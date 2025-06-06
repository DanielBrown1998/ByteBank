import 'dart:convert';

import 'package:app/models/transaction.dart';
import 'package:app/services/access.dart';
import 'package:app/services/interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart' as interceptor;

class TransactionService {
  final http.Client client = interceptor.InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<List<Transaction>> getTransactions() async {
    final http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw TransactionsServicesException("Failed to fetch transactions");
    }
  }

  Future<Transaction?> addTransaction(Transaction transaction) async {
    List<Transaction> transactions = await getTransactions();
    if (transaction.contact.name.isEmpty || transaction.value <= 0) {
      print("Invalid transaction data");
      throw TransactionsServicesException("Invalid transaction data");
    }

    transactions.add(transaction);
    List<Map<String, dynamic>> jsonTransactions =
        transactions.map((toElement) => toElement.toJson()).toList();

    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'password': password,
      },
      body: json.encode(jsonTransactions),
    );

    if (response.statusCode != 201) {
      print(response.statusCode);
      print('Failed to add transaction');
      throw TransactionsServicesException("Failed to add transaction");
    } else if (response.statusCode == 201) {
      print("Transaction added successfully");
      return transaction;
    }
    return null;
  }
}

class TransactionsServicesException implements Exception {
  final String message;

  TransactionsServicesException(this.message);

  @override
  String toString() {
    return 'TransactionsServicesException: $message';
  }
}
