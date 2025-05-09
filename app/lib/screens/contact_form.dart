import 'package:app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  late String name;
  late String account;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "New Contact",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "name",
                  icon: Icon(Icons.abc),
                  iconColor: Colors.green.shade800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: "account",
                  icon: Icon(Icons.money),
                  iconColor: Colors.green.shade800,
                ),
                controller: accountController,
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * .9,
                onPressed: () {
                  name = nameController.text;
                  account = accountController.text;
                  Contact contact = Contact(
                    id: 0,
                    name: name,
                    account: int.parse(account),
                  );
                  Navigator.pop(context, contact);
                },
                elevation: 10,
                shape: BeveledRectangleBorder(),
                color: Colors.green.shade700,
                splashColor: Colors.green,
                child: Text(
                  "create",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
