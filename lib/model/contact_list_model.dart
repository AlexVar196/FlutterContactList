import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import '../model/contact_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

/// This class is a singleton and it represents a contact list that contains contacts [ContactModel].
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

  /// Returns the contact list [contactList] or generates it if it's empty.
  List<ContactModel>? getContacts() {
    if (contactList == null) {
      contactList = parseContactsFromJson();
    }
    return contactList;
  }

  /// Adds a new [contact] to [contactList].
  void addContact(ContactModel contact) {
    contactList!.add(contact);
  }

  /// Removes a [contact] from [contactList].
  void deleteContact(ContactModel contact, BuildContext context) {
    contactList!.remove(contact);
  }

  /// Parses a Json file [data] and fills the [contactList] with newly generated contacts.
  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    return contacts;
  }
}
