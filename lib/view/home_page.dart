import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/contact_info_page.dart';
import '../model/contact_model.dart';
import '../controller/home_controller.dart';
import 'contact_add_page.dart';
import 'contact_edit_page.dart';

/// This builds the main page of the app.
/// Displays a list of contacts if they exist.
/// Provides functionality: view contact, edit contact.
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  /// appBar title.
  final String title = "Contacts";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Home controller (singleton) - retrieves the contact list.
  final HomeController _con = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),

      // Builds the contact list view.
      body: getContactListView(),

      // The floating button that allows adding new contacts.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigates to the ContactAddPage and on return updates state.
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactAddPage()))
              .then((value) => setState(() {}));
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }

  /// Responsible for generating a contact list.
  ///
  /// If no contacts found, displays a [message].
  /// IF contacts found, returns a ListView with contact information and separators.
  Widget getContactListView() {
    /// Message to display if contact list is empty.
    String message = "You don't have any contacts yet..";

    /// Retrieves contact list with help of controller.
    var _contactList = _con.getContactList();
    if (_contactList.isEmpty) {
      return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              message,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      );
    }

    /// Returns a ListView with contact information and separators.
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 80),
        itemCount: _contactList.length * 2,
        itemBuilder: (context, count) {
          if (count.isOdd) return Divider();
          final index = count ~/ 2;
          return _buildRow(_contactList[index]);
        });
  }

  /// Returns a ListTile with [contact] information which is one row in the list view.
  ///
  /// Icon button on the left - onClick navigates to [ContactInfoPage].
  /// Icon button on the right - onClick navigates to [ContactEditPage].
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
            // Navigates to the ContactInfoPage and on return updates state.
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
            // Navigates to the ContactEditPage and on return updates state.
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
