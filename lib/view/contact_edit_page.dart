import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/edit_page_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactEditPage extends StatefulWidget {
  ContactEditPage(this.contact, {Key? key}) : super(key: key);

  final ContactModel contact;
  final String title = "Contact List (Home)";

  @override
  _ContactListEditPage createState() => _ContactListEditPage();
}

class _ContactListEditPage extends State<ContactEditPage> {
  final EditPageController _con = EditPageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Editing: ${widget.contact.getFullName()}"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                log("Icons.delete for ${widget.contact.getFullName()}");
              })
        ],
      ),
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
                initialValue: widget.contact.getFirstName(),
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
                initialValue: widget.contact.getLastName(),
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
                initialValue: widget.contact.getPhoneNumber(),
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
                initialValue: widget.contact.getEmail(),
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
                    _con.updateContact(widget.contact, firstName, lastName,
                        phoneNumber, email, context);
                  });
                }
              },
              child: Text("Save Changes")),
        ]),
      ),
    );
  }
}
