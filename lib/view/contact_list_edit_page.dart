import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/edit_page_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactListEditPage extends StatefulWidget {
  ContactListEditPage(this.contact, {Key? key}) : super(key: key);

  final ContactModel contact;
  final String title = "Contact List (Home)";

  @override
  _ContactListEditPage createState() => _ContactListEditPage();
}

class _ContactListEditPage extends State<ContactListEditPage> {
  final EditPageController _con = EditPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editing: ")),
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
                  initialValue: widget.contact.getFirstName()),
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
                  initialValue: widget.contact.getLastName()),
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
                initialValue: widget.contact.getPhoneNumber(),
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
                  initialValue: widget.contact.getEmail()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact Successfully Edited')),
                );
              },
              child: Text("Save Changes")),
        ]),
      ),
    );
  }
}
