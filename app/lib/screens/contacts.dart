import 'package:app/database/app_database.dart';
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
      body: FutureBuilder(
        initialData: [],
        future: findAll(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _ContactItem(contact: snapshot.data![index]),
                  );
                },
              )
              : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("loading...")],
                ),
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
        subtitle: Text("${contact.account}"),
      ),
    );
  }
}
