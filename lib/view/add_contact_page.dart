import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/edit_page_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class AddContactPage extends StatefulWidget {
  AddContactPage({Key? key}) : super(key: key);

  final String title = "Add New Contact";

  @override
  _AddContactPage createState() => _AddContactPage();
}

class _AddContactPage extends State<AddContactPage> {
  // final EditPageController _con = EditPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.cyan,
              ),
              title: TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.cyan,
              ),
              title: TextFormField(
                decoration: InputDecoration(labelText: "Last Name"),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.cyan,
              ),
              title: TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.cyan,
              ),
              title: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact Successfully Edited')),
                );
              },
              child: Text("Add Contact")),
        ]),
      ),
    );
  }
}
