import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/info_page_controller.dart';
import '../model/contact_model.dart';

/// This builds the contact information page for a [contact].
/// Displays a an icon with contact initials, full name and cards with phone number and email.
/// Provides functionality: edit contact.
class ContactInfoPage extends StatefulWidget {
  ContactInfoPage(this.contact, {Key? key}) : super(key: key);

  /// [contact] who's information will be displayed.
  final ContactModel contact;

  /// AppBar title.
  final String title = "Contact List (Home)";

  @override
  _ContactListEditPage createState() => _ContactListEditPage();
}

class _ContactListEditPage extends State<ContactInfoPage> {
  /// This page's controller (singleton) - Responsible for responding to UI inputs.
  final InfoPageController _con = InfoPageController();

  /// Generates up to 3 initials from a [name].
  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(3).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.getFullName()),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Tells the controller that the edit button was pressed.
                _con.onEditPressed(context, widget.contact);
              })
        ],
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // The round icon that will display contact initials.
          CircleAvatar(
            child: Text(getInitials(widget.contact.getFullName()).toUpperCase(),
                style: TextStyle(fontSize: 45)),
            radius: 60.0,
            backgroundColor: Colors.amber,
          ),
          // Empty space.
          SizedBox(height: 15),
          // Contact full name text.
          Text(
            widget.contact.getFullName(),
            style: TextStyle(
                fontSize: 27.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5),
          ),
          // Phone number card.
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.cyan,
              ),
              title: Text(
                widget.contact.getPhoneNumber(),
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.cyan),
              ),
            ),
          ),
          // Email address card.
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.cyan,
              ),
              title: Text(
                widget.contact.getEmail(),
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    color: Colors.cyan),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
