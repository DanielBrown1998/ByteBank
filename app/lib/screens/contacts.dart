import 'package:app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({super.key});

  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(id: 0, name: "Daniel", account: "000001-8"));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ContactItem(contact: contacts[index]),
          );
        },
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

class _ContactItem extends StatelessWidget {
  final Contact contact;
  const _ContactItem({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: BeveledRectangleBorder(),
      child: ListTile(
        iconColor: Colors.black87,
        onTap: () {},
        textColor: Colors.black87,
        selectedColor: Colors.white,
        title: Text(
          contact.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.account),
      ),
    );
  }
}
