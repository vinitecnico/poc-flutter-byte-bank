import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:poc_byte_bank_v2/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
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
}
