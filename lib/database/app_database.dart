import 'package:path/path.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER) ');
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contact contact) async {
  final Database db = await createDatabase.call();
  return db.insert('contacts', contact.toMap());
}

Future<List<Contact>> findAll() async {
  final Database db = await createDatabase.call();
  final List<Map<String, Object?>> result = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact =
        Contact(row['id'], row['name'], row['account_number']);
    contacts.add(contact);
  }
  return contacts;
}
