import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:flutter_app/view/edit_contact_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactInfoController extends ControllerMVC {
  static ContactInfoController _controller = ContactInfoController._internal();

  /// Singleton Factory
  factory ContactInfoController() {
    if (_controller == null) _controller = ContactInfoController._internal();
    return _controller;
  }

  ContactInfoController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static ContactInfoController get con => _controller;

  void onEditPressed(NavigatorState nav, ContactModel contact) {
    nav.push(MaterialPageRoute(builder: (context) => EditContactPage(contact)));
  }
}
