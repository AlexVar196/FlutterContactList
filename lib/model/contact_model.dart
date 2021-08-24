import 'dart:developer';

class ContactModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
      };

  @override
  String toString() {
    return '{ ${this.firstName} ${this.lastName} , phone: ${this.phoneNumber} email: ${this.email}}';
  }

  String getFullName() {
    return firstName + " " + lastName;
  }

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getEmail() {
    return email;
  }

  void _setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void _setLastName(String lastName) {
    this.lastName = lastName;
  }

  void _setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void _setEmail(String email) {
    this.email = email;
  }

  void updateAll(
      String firstName, String lastName, String phoneNumber, String email) {
    _setFirstName(firstName);
    _setLastName(lastName);
    _setPhoneNumber(phoneNumber);
    _setEmail(email);

    log("Contact updated: name: $firstName, last: $lastName, phone: $phoneNumber, email: $email");
  }
}
