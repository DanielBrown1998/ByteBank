import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(String sql) async {
  final String dbPath = await getDatabasesPath();
  String path = join(dbPath, "bankbyte.db");
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(sql);
    },
    onDowngrade: onDatabaseDowngradeDelete,
    singleInstance: true,
  );
  return database;
}
