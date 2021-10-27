import 'package:flutter/material.dart';
import 'package:poc_byte_bank_v2/database/app_database.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:poc_byte_bank_v2/screens/contact_form.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return _ContactItem(contact);
                },
                itemCount: contacts?.length,
              );
          }
          return const Text('unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
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
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(contact.accountNumber.toString(),
            style: const TextStyle(
              fontSize: 16.0,
            )),
      ),
    );
  }
}
