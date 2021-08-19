import 'dart:core';
import 'package:flutter/material.dart';
import './contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contacts',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: ContactList(title: 'My Contacts (Home Page)'));
  }
}