import 'package:flutter/material.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  void _createContact(context) {
    final String name = _nameController.text;
    final int? accountNumber = int.tryParse(_accountNumberController.text);

    if (name != null && accountNumber != null) {
      final Contact newContact = Contact(name, accountNumber);
      Navigator.pop(context, newContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('new contact'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('full name'),
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                controller: _nameController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('account number'),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  controller: _accountNumberController,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => _createContact(context),
                      child: const Text('Create')),
                ),
              )
            ],
          ),
        ));
  }
}
