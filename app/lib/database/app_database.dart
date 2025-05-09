import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/contact.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  String path = join(dbPath, "bankbyte.db");
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute("create table contact(id INTEGER PRIMARY KEY, name TEXT, account INTEGER)");
    },
  );
  return database;
}

Future<int> save(Contact contact) {
  return createDatabase().then(
    (db) async => await db.insert("contact", {
      "id": contact.id,
      "name": contact.name,
      "account": contact.account,
    }),
  );
}

Future<List<Contact>?> findAll() {
  return createDatabase().then((db) async {
    return await db
        .query("contact")
        .then(
          (list) => list.map((contact) => Contact.fromMap(contact)).toList(),
        );
  });
}
