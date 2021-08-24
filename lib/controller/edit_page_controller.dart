import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class EditPageController extends ControllerMVC {
  static EditPageController _controller = EditPageController._internal();

  /// Singleton Factory
  factory EditPageController() {
    if (_controller == null) _controller = EditPageController._internal();
    return _controller;
  }

  EditPageController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static EditPageController get con => _controller;

  void updateContact(ContactModel contact, String firstName, String lastName,
      String phoneNumber, String email, BuildContext context) {
    contact.updateAll(firstName, lastName, phoneNumber, email);

    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact Successfully Updated')),
    );*/
    log("name: $firstName, last: $lastName, phone: $phoneNumber, email: $email");

    Navigator.pop(context, () {
      setState(() {});
    });
  }

  void onDeletePressed(BuildContext context, ContactModel contact) {
    log("name: ${contact.getFullName()} delete");

    final ContactListModel cl = ContactListModel();
    if (contact != null) {
      cl.deleteContact(contact, context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Contact deleted successfully!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing to delete')));
    }
    Navigator.pop(context, () {
      setState(() {});
    });
  }
}
