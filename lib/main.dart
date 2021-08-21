import 'dart:core';
import 'package:flutter/material.dart';
import './contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contacts',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: ContactList(title: 'My Contacts (Home Page)'));
  }
}
