import 'package:app/components/progress.dart';
import 'package:app/database/dao/contact_dao.dart';
import 'package:app/models/contact.dart';
import 'package:app/screens/contact_form.dart';
import 'package:app/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer')),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(
                    contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => TransactionForm(contact: contact),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              );
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(contact.name, style: TextStyle(fontSize: 24.0)),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
