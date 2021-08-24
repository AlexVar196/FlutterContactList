import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'model/contact_model.dart';
import 'view/home_page.dart';
import '../model/contact_list_data_string.dart' as contactListData;

void main() => runApp(MyApp());

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
