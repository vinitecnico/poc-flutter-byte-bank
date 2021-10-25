import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:poc_byte_bank_v2/screens/contact_form.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [];
  ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(0, 'test', 123));
    return Scaffold(
      appBar: AppBar(
        title: Text('contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  const _ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(
              fontSize: 16.0,
            )),
      ),
    );
  }
}
