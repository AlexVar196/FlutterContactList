import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';

/// This controller is a singleton that responds to UI inputs from the [ContactAddPage].
///
/// Adds a new contact.
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

  /// Called when addContact button is pressed - creates a new contact and adds it to contact list.
  ///
  /// Displays snack bar message if added or not and then navigates back and refreshes previous page.
  void addContact(String firstName, String lastName, String phoneNumber,
      String email, BuildContext context) {
    /// Gets the contact list singleton and creates new contact.
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
