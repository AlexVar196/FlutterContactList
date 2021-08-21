import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../model/contact_model.dart';
import '../controller/contact_list_controller.dart';
import '../model/contact_list_string.dart' as contactListData;

class ContactListHome extends StatefulWidget {
  ContactListHome({Key? key}) : super(key: key);


  @override
  _ContactListHomeState createState() => _ContactListHomeState();
}

class _ContactListHomeState extends State<ContactListHome> {

  final ContactListController  _con = ContactListController();

  List<ContactModel> parseContactsFromJson() {
    var jsonData = jsonDecode(contactListData.data) as List;
    List<ContactModel> contacts =
        jsonData.map((x) => ContactModel.fromJson(x)).toList();
    print(contacts);
    return contacts;
  }

  Widget getContactListView() {
    var _contactList = parseContactsFromJson();

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
            String name = contact.getFullName();
            log("_viewContact $name");
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
            String name = contact.getFullName();
            log("_editContact $name");
            _editContactInfo(contact);
          },
        ),
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(3).join()
      : '';

  void _editContactInfo(ContactModel contact) {
    String name = contact.getFullName();
    log("_editContactInfo for $name");

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Editing: " + name)),
        body: Form(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.cyan,
                ),
                title: TextFormField(
                    decoration: InputDecoration(labelText: "First Name"),
                    initialValue: contact.getFirstName()),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.cyan,
                ),
                title: TextFormField(
                    decoration: InputDecoration(labelText: "Last Name"),
                    initialValue: contact.getLastName()),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.cyan,
                ),
                title: TextFormField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                  initialValue: contact.getPhoneNumber(),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.cyan,
                ),
                title: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    initialValue: contact.getEmail()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Contact Successfully Edited')),
                  );
                },
                child: Text("Save Changes")),
          ]),
        ),
      );
    }));
  }

  void _viewContactInfo(ContactModel contact) {
    String name = contact.getFullName();
    log("_viewContactInfo for $name");

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  log("Icons.edit for $name");
                })
          ],
        ),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              child: Text(getInitials(name).toUpperCase(),
                  style: TextStyle(fontSize: 45)),
              radius: 60.0,
              backgroundColor: Colors.amber,
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                  fontSize: 27.0,
                  fontFamily: 'Source Sans Pro',
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.cyan,
                ),
                title: Text(
                  contact.getPhoneNumber(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.cyan),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.cyan,
                ),
                title: Text(
                  contact.getEmail(),
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.cyan),
                ),
              ),
            ),
          ]),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('widget.title'),
      ),
      body: getContactListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addContact() {
    log("_addContact");
  }
}