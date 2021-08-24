import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/info_page_controller.dart';
import 'dart:developer';
import '../model/contact_model.dart';

class ContactInfoPage extends StatefulWidget {
  ContactInfoPage(this.contact, {Key? key}) : super(key: key);

  final ContactModel contact;
  final String title = "Contact List (Home)";

  @override
  _ContactListEditPage createState() => _ContactListEditPage();
}

class _ContactListEditPage extends State<ContactInfoPage> {
  final InfoPageController _con = InfoPageController();

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
                _con.onEditPressed(context, widget.contact);
                log("Icons.edit for ${widget.contact.getFullName()}");
              })
        ],
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            child: Text(getInitials(widget.contact.getFullName()).toUpperCase(),
                style: TextStyle(fontSize: 45)),
            radius: 60.0,
            backgroundColor: Colors.amber,
          ),
          SizedBox(height: 15),
          Text(
            widget.contact.getFullName(),
            style: TextStyle(
                fontSize: 27.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5),
          ),
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
