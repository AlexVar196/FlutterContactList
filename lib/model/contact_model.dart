/// This class represents on contact object.
class ContactModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  /// Constructor requires [firstName], [lastName], [phoneNumber] and [email].
  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  /// Factory that maps json's [firstName], [lastName], [phoneNumber] and [email] and creates new contact.
  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  /// Maps contact fields to a json.
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

  /// Updates all contact fields.
  void updateAll(
      String firstName, String lastName, String phoneNumber, String email) {
    _setFirstName(firstName);
    _setLastName(lastName);
    _setPhoneNumber(phoneNumber);
    _setEmail(email);
  }

  /// Returns a string of first and last name.
  String getFullName() {
    return firstName + " " + lastName;
  }

  /// [firstName] getter.
  String getFirstName() {
    return firstName;
  }

  /// [lastName] getter.
  String getLastName() {
    return lastName;
  }

  /// [phoneNumber] getter.
  String getPhoneNumber() {
    return phoneNumber;
  }

  /// [email] getter.
  String getEmail() {
    return email;
  }

  /// [firstName] setter.
  void _setFirstName(String firstName) {
    this.firstName = firstName;
  }

  /// [lastName] setter.
  void _setLastName(String lastName) {
    this.lastName = lastName;
  }

  /// [phoneNumber] setter.
  void _setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  /// [email] setter.
  void _setEmail(String email) {
    this.email = email;
  }
}
