import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/add_page_controller.dart';

class ContactAddPage extends StatefulWidget {
  ContactAddPage({Key? key}) : super(key: key);

  /// appBar title.
  final String title = "Add New Contact";

  @override
  _AddContactPage createState() => _AddContactPage();
}

class _AddContactPage extends State<ContactAddPage> {
  /// This page's controller (singleton) - Responsible for responding to UI inputs.
  final AddPageController _con = AddPageController();

  /// Form's global Key.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // A form that collects user input and validates that fields are not empty.
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
          // When pressed, submits the form inputs and passes data to the controller.
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _con.addContact(
                        firstName, lastName, phoneNumber, email, context);
                  });
                }
              },
              child: Text("Add Contact")),
        ]),
      ),
    );
  }
}
