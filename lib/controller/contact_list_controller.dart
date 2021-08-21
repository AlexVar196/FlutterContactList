import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';

class ContactListController extends ControllerMVC  {

  static ContactListController _controller = ContactListController._internal();

  /// Singleton Factory
  factory ContactListController(){
    if (_controller == null) _controller = ContactListController._internal();
    return _controller;
  }

  ContactListController._internal();
  /// Allow for easy access to 'the Controller' throughout the application.
  static ContactListController get con => _controller;

  int get counter => ContactListModel.num;
  int _counter = 0;
  void incrementCounter() => _counter++;
}