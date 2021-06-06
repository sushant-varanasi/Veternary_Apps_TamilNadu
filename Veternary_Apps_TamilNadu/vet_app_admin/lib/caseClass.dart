
class Case {
  final String puid;
  final String uid;
  final String caseid;

  Case({this.puid, this.uid, this.caseid});
}

class CaseData {
  final String caseid;
  final String imageurl;
  final String uid;
  final String puid;
  final String species;
  final String breed;
  final String severityDoc;
  final String severityUser;
  final String description;
  final String status;
  final String rdate;
  final String adate;
  final String doctor;
  final bool emergency;
  final bool homevisit;
  final String comment; //to doctor
  final String location;
  final String instructions; //to user
  final String year;
  final int OTP;
  final String stat;
  final int days;
  final String latlong;
  final String notif;


  CaseData(
      {this.caseid,
        this.imageurl,
        this.uid,
        this.puid,
        this.species,
        this.breed,
        this.severityDoc,
        this.severityUser,
        this.description,
        this.location,
        this.status,
        this.rdate,
        this.adate,
        this.doctor,
        this.homevisit,
        this.comment,
        this.year,
        this.instructions,
        this.emergency,
        this.OTP,
        this.stat,
        this.days,
      this.latlong,
      this.notif});
}