import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';

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

  /// Called when updateContact button is pressed - edits an existing contact in the contact list.
  ///
  /// Displays snack bar message and then navigates back and refreshes previous page.
  void updateContact(ContactModel contact, String firstName, String lastName,
      String phoneNumber, String email, BuildContext context) {
    contact.updateAll(firstName, lastName, phoneNumber, email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact Successfully Updated')),
    );
    Navigator.pop(context, () {
      setState(() {});
    });
  }

  /// Called when deleteContact button is pressed - deletes an existing contact from the contact list.
  ///
  /// Displays snack bar message and then navigates back and refreshes previous page.
  void onDeletePressed(BuildContext context, ContactModel contact) {
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
