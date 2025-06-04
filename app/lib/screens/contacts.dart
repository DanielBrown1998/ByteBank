import 'package:app/database/dao/contact_dao.dart';
import 'package:app/models/contact.dart';
import 'package:app/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactDao _dao = ContactDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ActionIconTheme(
            data: ActionIconThemeData(),
            child: IconButton(
              onPressed: () => setState(() {}),
              icon: Icon(Icons.update),
            ),
          ),
        ],
        title: Text(
          "Transfer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("loading...")],
                ),
              );
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    //TODO implements onTap for NewTransactionPage
                    //TODO in NewTransactionPage add log in db create
                    child: _ContactItem(contact: snapshot.data![index]),
                  );
                },
              );
            case ConnectionState.none:
              return Center(child: Text("NO data!"));
            default:
              return Center(child: Text("We have a problem, sorry"));
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "contact_form").then((value) {
            setState(() {});
          });
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
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TransactionForm(contact: contact),
            ),
          );
        },
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
