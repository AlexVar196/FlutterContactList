import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/add_page_controller.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/edit_page_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactAddPage extends StatefulWidget {
  ContactAddPage({Key? key}) : super(key: key);

  final String title = "Add New Contact";

  @override
  _AddContactPage createState() => _AddContactPage();
}

class _AddContactPage extends State<ContactAddPage> {
  final AddPageController _con = AddPageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.cyan,
              ),
              title: TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  firstName = value;
                  return null;
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  lastName = value;
                  return null;
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  phoneNumber = value;
                  return null;
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  email = value;
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _con.addContact(
                        firstName, lastName, phoneNumber, email, context);
                  });
                }
              },
              child: Text("Save Changes")),
        ]),
      ),
    );
  }
}
