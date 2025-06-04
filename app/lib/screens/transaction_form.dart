import 'package:app/models/contact.dart';
import 'package:app/models/transaction.dart';
import 'package:app/services/transactions_services.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;
  const TransactionForm({super.key, required this.contact});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  TransactionService transactionService = TransactionService();

  @override
  void initState() {
    idController.text = widget.contact.id.toString();
    nameController.text = widget.contact.name;
    accountController.text = widget.contact.account.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Transação")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 25,
          children: [
            TextField(controller: idController, readOnly: true),
            TextField(controller: nameController, readOnly: true),
            TextField(controller: accountController, readOnly: true),
            TextField(
              controller: balanceController,
              enabled: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: "insira o valor",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(alignment: Alignment.center),
                onPressed: () async {
                  try {
                    await transactionService.addTransaction(
                      Transaction(
                        value: double.parse(balanceController.text),
                        contact: widget.contact.account.toString(),
                        name: widget.contact.name,
                      ),
                    );
                    Navigator.pop(context);
                  } on TransactionsServicesException catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.message)));
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.save), Text("Salvar")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
