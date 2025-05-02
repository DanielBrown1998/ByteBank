import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/contact.dart';

final String tableName = "contact";

Future<Database> createDatabase() async {
  String database = await getDatabasesPath();
  final String path = join(database, "bytebank.db");

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        "IF NOT EXISTS CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY, "
        "name TEXT NOT NULL "
        "account INTEGER NOT NULL); ",
      );
    },
    version: 1,
  );
}

Future<int> save(Contact contact) async {
  Database db = await createDatabase();
  return await db.insert(tableName, {
    "id": contact.id,
    "name": contact.name,
    "account": contact.account,
  });
}

Future<List<Contact>?> findAll() async {
  Database db = await createDatabase();
  List<Map<String, dynamic>> list = await db.query(tableName);
  return list.map((contact) => Contact.fromMap(contact)).toList();
}
