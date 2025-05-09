import 'package:app/database/app_database.dart';
import 'package:app/models/contact.dart';

class ContactDao {
  static const String _tableName = "contact";
  static const String name = "name";
  static const String id = "id";
  static const String account = "account";
  static const String createTableSQL =
      "create table $_tableName($id INTEGER PRIMARY KEY, $name TEXT, $account INTEGER)";

  Future<int> save(Contact contact) {
    return getDatabase(createTableSQL).then(
      (db) async => await db.insert(_tableName, {
        id: contact.id,
        name: contact.name,
        account: contact.account,
      }),
    );
  }

  Future<List<Contact>> findAll() {
    return getDatabase(createTableSQL).then((db) async {
      return await db
          .query(_tableName)
          .then(
            (list) => list.map((contact) => Contact.fromMap(contact)).toList(),
          );
    });
  }
}
