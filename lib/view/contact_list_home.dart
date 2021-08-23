import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/contact_info_page.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/contact_list_home_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;
import 'contact_list_edit_page.dart';

class ContactListHome extends StatefulWidget {
  ContactListHome({Key? key}) : super(key: key);

  final String title = "Contact List (Home)";

  @override
  _ContactListHomeState createState() => _ContactListHomeState();
}

class _ContactListHomeState extends State<ContactListHome> {
  final ContactListHomeController _con = ContactListHomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getContactListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: _con.onAddContactPressed,
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    //print(contacts);
    return contacts;
  }

  Widget getContactListView() {
    //  var _contactList = parseContactsFromJson();
    var _contactList = _con.parseContactsFromJson();
    return ListView.builder(
        itemCount: _contactList.length * 2,
        itemBuilder: (context, count) {
          if (count.isOdd) return Divider();
          final index = count ~/ 2;
          return _buildRow(_contactList[index]);
        });
  }

  Widget _buildRow(ContactModel contact) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        child: IconButton(
          icon: new Icon(
            Icons.account_circle,
            size: 38,
          ),
          onPressed: () {
            log("_viewContactInfo(contact)");
            _viewContactInfo(contact);
          },
        ),
      ),
      title: Text(contact.getFullName()),
      subtitle: Text(contact.phoneNumber),
      trailing: Container(
        height: double.infinity,
        child: IconButton(
          icon: new Icon(
            Icons.edit,
            size: 28,
          ),
          onPressed: () {
            log("_editContactInfo.(contact)");
            _editContactInfo(contact);
          },
        ),
      ),
    );
  }

  void _editContactInfo(ContactModel contact) {
    _con.onEditContactPressed(Navigator.of(context), contact);
  }

  void _viewContactInfo(ContactModel contact) {
    _con.onViewContactPressed(Navigator.of(context), contact);
  }
}
