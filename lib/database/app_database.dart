import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(String sql) async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(path,
    onCreate: ((db, version) => db.execute(sql)),
    version: 1,
  );
}
