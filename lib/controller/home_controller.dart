import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:flutter_app/view/contact_add_page.dart';
import 'package:flutter_app/view/contact_info_page.dart';
import 'package:flutter_app/view/contact_edit_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class HomeController extends ControllerMVC {
  //var contactList;
  static HomeController _controller = HomeController._internal();

  /// Singleton Factory
  factory HomeController() {
    if (_controller == null) _controller = HomeController._internal();
    return _controller;
  }

  HomeController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static HomeController get con => _controller;

/*  void onEditContactPressed(BuildContext context, ContactModel contact) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ContactEditPage(contact)));
  }

  void onViewContactPressed(BuildContext context, ContactModel contact) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ContactInfoPage(contact)));
  }*/

/*  void onAddContactPressed(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactAddPage()));
  }*/

  List<ContactModel> getContactList() {
    final ContactListModel cl = ContactListModel();
    var contacts = cl.getContacts();
    if (contacts != null) {
      return contacts;
    } else {
      return List.empty();
    }
  }

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    print(contacts);
    return contacts;
  }
}
