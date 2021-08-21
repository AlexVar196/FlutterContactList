
class ContactModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  ContactModel({required this.firstName, required this.lastName, required this.phoneNumber, required this.email,});

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

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setEmail(String email) {
    this.email = email;
  }
}
