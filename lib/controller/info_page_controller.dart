import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:flutter_app/view/contact_edit_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class InfoPageController extends ControllerMVC {
  static InfoPageController _controller = InfoPageController._internal();

  /// Singleton Factory
  factory InfoPageController() {
    if (_controller == null) _controller = InfoPageController._internal();
    return _controller;
  }

  InfoPageController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static InfoPageController get con => _controller;

  void onEditPressed(NavigatorState nav, ContactModel contact) {
    nav.push(MaterialPageRoute(builder: (context) => ContactEditPage(contact)));
  }
}
