import 'dart:core';
import 'package:flutter/material.dart';
import 'view/home_page.dart';

void main() => runApp(MyApp());

/// The application provides a contact list and core functionality.
///
/// The app allows displaying, editing, adding and deleting contacts.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
