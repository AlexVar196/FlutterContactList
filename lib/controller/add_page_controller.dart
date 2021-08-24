import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class AddPageController extends ControllerMVC {
  static AddPageController _controller = AddPageController._internal();

  /// Singleton Factory
  factory AddPageController() {
    if (_controller == null) _controller = AddPageController._internal();
    return _controller;
  }

  AddPageController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static AddPageController get con => _controller;

  void addContact(String firstName, String lastName, String phoneNumber,
      String email, BuildContext context) {
    final ContactListModel cl = ContactListModel();
    ContactModel newContact = ContactModel(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
    );

    if (newContact != null) {
      cl.addContact(newContact);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contact Added Successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable To Add Contact')),
      );
    }

    Navigator.pop(context, () {
      setState(() {});
    });
  }
}
