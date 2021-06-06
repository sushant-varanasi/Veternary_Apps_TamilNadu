class Pet {
  final String puid;
  final String uid;

  Pet({this.puid, this.uid});
}

class PetData {
  final String uid;
  final String puid;
  final String name;
  final String species;
  final String breed;
  final String history;
  final String year;
  final String animalnumber;

  PetData(
      {this.uid,
      this.puid,
      this.name,
      this.species,
      this.breed,
      this.history,
      this.year,
      this.animalnumber});
}
