import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';

/// This controller is a singleton that responds to UI inputs from the [HomePage].
///
/// Retrieves the contact list from [ContactListModel].
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

  /// Gets the contact list model singleton and retrieves a contact list.
  ///
  /// If list doesn't exist, returns an empty list.
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
