import 'dart:convert';
import 'dart:developer';

import 'package:flutter/src/widgets/framework.dart';

import '../model/contact_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class ContactListModel {
  static ContactListModel _contactList = ContactListModel._internal();
  List<ContactModel>? contactList;

  /// Singleton Factory
  factory ContactListModel() {
    if (_contactList == null) _contactList = ContactListModel._internal();
    return _contactList;
  }

  ContactListModel._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static ContactListModel get cl => _contactList;

  List<ContactModel>? getContacts() {
    if (contactList == null) {
      contactList = parseContactsFromJson();
    }
    return contactList;
  }

  void addContact(ContactModel contact) {
    contactList!.add(contact);
  }

  void deleteContact(ContactModel contact, BuildContext context) {
    contactList!.remove(contact);
  }

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    return contacts;
  }
}
