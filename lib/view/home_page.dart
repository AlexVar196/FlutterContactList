import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/contact_list_model.dart';
import 'package:flutter_app/view/contact_info_page.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/home_controller.dart';
import '../model/contact_list_data_string.dart' as contactListData;
import 'contact_add_page.dart';
import 'contact_edit_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = "Contacts";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _con = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: getContactListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactAddPage()))
              .then((value) => setState(() {}));
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getContactListView() {
    var _contactList = _con.getContactList();
    if (_contactList.isEmpty) {
      return Text(
        "Currently there are no contacts.",
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }

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
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => ContactInfoPage(contact)))
                .then((value) => setState(() {}));
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
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => ContactEditPage(contact)))
                .then((value) => setState(() {}));
          },
        ),
      ),
    );
  }
}
