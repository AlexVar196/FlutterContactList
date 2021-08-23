import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:flutter_app/view/contact_info_page.dart';
import 'package:flutter_app/view/contact_list_edit_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactListHomeController extends ControllerMVC {
  static ContactListHomeController _controller =
      ContactListHomeController._internal();

  /// Singleton Factory
  factory ContactListHomeController() {
    if (_controller == null)
      _controller = ContactListHomeController._internal();
    return _controller;
  }

  ContactListHomeController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static ContactListHomeController get con => _controller;

  int get counter => ContactListModel.num;

  void addContact() => ContactListModel().addContact();

  void onEditContactPressed(NavigatorState nav, ContactModel contact) {
    String name = contact.getFullName();
    log("ContactListHomeController: onEditContactPressed for $name");
    nav.push(MaterialPageRoute(builder: (context) => ContactListEditPage(contact)));
  }

  void onViewContactPressed(NavigatorState nav, ContactModel contact) {
    nav.push(MaterialPageRoute(builder: (context) => ContactInfoPage(contact)));
    log("ContactListHomeController: onViewContactPressed");
/*
    String name = contact.getFullName();
    log("controller onViewContactPressed for $name");*/
/*
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ContactInfoPage(contact)));
    log("ContactListHomeController: onAddContactPressed");*/
  }

  void onAddContactPressed() {
    log("ContactListHomeController: onAddContactPressed");
  }

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    print(contacts);
    return contacts;
  }
}
