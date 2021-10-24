import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDatabase() {
  getDatabasesPath().then((dtPath) {
    final String path = join(dtPath, 'bytebank.db');
    openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTERGER PRIMARY KEY, '
          'name TEXT'
          'account_number INTERGER)');
    }, version: 1);
  });
}
