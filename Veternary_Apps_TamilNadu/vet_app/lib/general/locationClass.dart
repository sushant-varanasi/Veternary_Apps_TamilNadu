import 'package:geolocator/geolocator.dart';
import 'package:vet_app/english/animalInfo.dart';

class Location {
  String locid;
  String uid;
  Location({this.locid, this.uid});
}

class LocationData {
  String locid;
  String uid;
  String position; //(lat,lon)
  String name;
  String village;
  LocationData({this.locid, this.uid, this.position, this.name, this.village});
}

/*to do
pet->animalInfo
add case to image
voice for description
severity dropdown/scale
homevisit-radiobutton
emergency-radio button
emergency-register case,mandatory photograph regiter emergency in cases and emergenct case collections
first aid
in case tile what doctor prescribed

 */
