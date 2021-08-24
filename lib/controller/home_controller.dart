import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';

class HomeController extends ControllerMVC {
  static HomeController _controller = HomeController._internal();

  /// Singleton Factory
  factory HomeController() {
    if (_controller == null) _controller = HomeController._internal();
    return _controller;
  }

  HomeController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static HomeController get con => _controller;

  List<ContactModel> getContactList() {
    final ContactListModel cl = ContactListModel();
    var contacts = cl.getContacts();
    if (contacts != null) {
      return contacts;
    } else {
      return List.empty();
    }
  }
}
