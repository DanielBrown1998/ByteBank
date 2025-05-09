import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  String path = join(dbPath, "bankbyte.db");
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        "create table contact(id INTEGER PRIMARY KEY, name TEXT, account INTEGER)",
      );
    },
    onDowngrade: onDatabaseDowngradeDelete,
    singleInstance: true,
  );
  return database;
}
