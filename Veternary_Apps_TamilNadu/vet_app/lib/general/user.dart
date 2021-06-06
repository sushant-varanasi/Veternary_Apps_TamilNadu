class User {
  final String uid;

  User({this.uid});
}
class PhoneUser {
  final String phno;
  PhoneUser({this.phno});
}
class UserData {
  final String uid;
  final String name;
  final String aadhaar;
  final String email;
  final String mobile;

  UserData({this.uid, this.name, this.aadhaar, this.mobile, this.email});
}

class AnimalData {
  final String uid;
  final String animal;
  final String breed;
  final String severity;
  final String pincode;
  final String description;

  AnimalData(
      {this.uid,
      this.animal,
      this.breed,
      this.severity,
      this.pincode,
      this.description});
}
