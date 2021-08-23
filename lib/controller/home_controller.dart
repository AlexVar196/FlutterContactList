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
  static HomeController _controller =
      HomeController._internal();

  /// Singleton Factory
  factory HomeController() {
    if (_controller == null)
      _controller = HomeController._internal();
    return _controller;
  }

  HomeController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static HomeController get con => _controller;

  int get counter => ContactListModel.num;

  void addContact() => ContactListModel().addContact();

  void onEditContactPressed(NavigatorState nav, ContactModel contact) {
    nav.push(MaterialPageRoute(builder: (context) => ContactEditPage(contact)));
  }

  void onViewContactPressed(NavigatorState nav, ContactModel contact) {
    nav.push(MaterialPageRoute(builder: (context) => ContactInfoPage(contact)));
  }

  void onAddContactPressed(NavigatorState nav) {
       nav.push(MaterialPageRoute(builder: (context) => ContactAddPage()));
  }

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    print(contacts);
    return contacts;
  }
}
