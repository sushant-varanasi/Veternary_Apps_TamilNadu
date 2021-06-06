class Doctor {
  final String docid;
  Doctor({this.docid});
}

class PhoneUser {
  final String phno;
  PhoneUser({this.phno});
}

class Doctordata {
  final String docid; //
  final String profile;
  final String speciality;
  final String locality;  //
  final String aadhar;   //
  final String name;   //
  final String imageurl;
  final String email;
  final String mobile;    //
  final String yofexperience;
  Doctordata(
      {this.name,
      this.docid,
      this.email,
      this.aadhar,
      this.imageurl,
      this.locality,
      this.mobile,
      this.profile,
      this.speciality,
      this.yofexperience});
}
