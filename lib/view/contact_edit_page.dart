import 'dart:core';
import 'package:flutter/material.dart';
import '../model/contact_model.dart';
import '../controller/edit_page_controller.dart';

/// This builds the contact edit page for a [contact].
/// Displays a form with current first and last name, phone number and email.
/// Provides functionality: update contact, delete contact.
class ContactEditPage extends StatefulWidget {
  ContactEditPage(this.contact, {Key? key}) : super(key: key);

  /// [contact] who's information will be edited or deleted.
  final ContactModel contact;

  /// appBar title.
  final String title = "Contact List (Home)";

  @override
  _ContactListEditPage createState() => _ContactListEditPage();
}

class _ContactListEditPage extends State<ContactEditPage> {
  /// This page's controller (singleton) - Responsible for responding to UI inputs.
  final EditPageController _con = EditPageController();

  /// Form's global Key.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editing: ${widget.contact.getFullName()}"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // When delete icon pressed, shows a dialog confirmation question.
                showAlertDialog();
              })
        ],
      ),
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
          // When pressed, submits the form inputs and passes data to the controller.
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

  /// Dialog box that asks the user whether the contact should be deleted.
  ///
  /// If 'cancel' preseed, closes the dialog.
  /// If 'Delete Contact' pressed, deletes user, returns to previous screen and refreshes it.
  showAlertDialog() {
    // Sets up the buttons cancel/delete contact.
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete Contact"),
      onPressed: () {
        _con.onDeletePressed(context, widget.contact);
        Navigator.pop(context);
      },
    );

    // Sets up the AlertDialog.
    AlertDialog alert = AlertDialog(
      title: Text("Delete Contact"),
      content: Text(
          "Are you sure you want to permanently delete '${widget.contact.getFullName()}'?"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // Shows the dialog box.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
