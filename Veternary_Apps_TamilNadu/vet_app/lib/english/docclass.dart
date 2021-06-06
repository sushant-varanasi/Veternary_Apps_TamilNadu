class Doctor {
  final String docid;
  Doctor({this.docid});
}

class Doctordata {
  final String profile;
  final String speciality;
  final String locality;
  final String aadhar;
  final String name;
  final String imageurl;
  final String email;
  final String mobile;
  final String yofexperience;
  Doctordata(
      {this.name,
      this.email,
      this.aadhar,
      this.imageurl,
      this.locality,
      this.mobile,
      this.profile,
      this.speciality,
      this.yofexperience});
}
