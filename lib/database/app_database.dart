import 'package:path/path.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dtPath) {
    final String path = join(dtPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER) ');
    }, version: 1);
  });
}

Future<int> save(Contact contact) {
  return createDatabase.call().then((db) {
    // final Map<String, dynamic> contactMap = Map();
    // contactMap['id'] = contact.id;
    // contactMap['name'] = contact.name;
    // contactMap['account_number'] = contact.accountNumber;
    // return db.insert('contacts', contactMap);
    return db.insert('contacts', contact.toMap());
  });
}

Future<List<Contact>> findAll() {
  return createDatabase.call().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact =
            Contact(map['id'], map['name'], map['account_number']);
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
