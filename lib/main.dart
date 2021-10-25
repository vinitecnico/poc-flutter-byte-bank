import 'package:flutter/material.dart';
import 'package:poc_byte_bank_v2/database/app_database.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:poc_byte_bank_v2/screens/dashboard.dart';

void main() {
  runApp(const ByteBankApp());
  debugPrint('start>>>');
  save(Contact(0, 'vinicius', 123)).then((id) {
    debugPrint('here>>>');
    findAll().then((contacts) {
      debugPrint(contacts.toString());
    });
  });
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.green[900],
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: const Dashboard(),
    );
  }
}
