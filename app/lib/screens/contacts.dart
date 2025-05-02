import 'dart:async';

import 'package:app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              shape: BeveledRectangleBorder(),
              child: ListTile(
                iconColor: Colors.black87,
                onTap: () {},
                textColor: Colors.black87,
                selectedColor: Colors.white,
                title: Text(
                  "Contact 01",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("1000"),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "contact_form",
          ).then((value) => debugPrint(value.toString()));
        },
        splashColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
