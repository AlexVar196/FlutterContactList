import '../model/contact_model.dart';

class ContactListModel {
  static int _num = 0;

  static int get num => _num;

  static List<ContactModel>? contactList = null;

  void addContact() {}

  void removeContact() {}

  void editContact() {}
}
