class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  Contact(this.firstName, this.lastName, this.phoneNumber, this.email);

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
