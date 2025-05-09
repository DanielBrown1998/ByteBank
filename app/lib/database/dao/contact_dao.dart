import 'package:app/database/app_database.dart';
import 'package:app/models/contact.dart';

class ContactDao {
  Future<int> save(Contact contact) {
    return getDatabase().then(
      (db) async => await db.insert("contact", {
        "id": contact.id,
        "name": contact.name,
        "account": contact.account,
      }),
    );
  }

  Future<List<Contact>> findAll() {
    return getDatabase().then((db) async {
      return await db
          .query("contact")
          .then(
            (list) => list.map((contact) => Contact.fromMap(contact)).toList(),
          );
    });
  }
}
