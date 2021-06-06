import 'dart:math';

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });
  }
}

class CitiesService {
  static final List<String> cities = [
    'Chennai',
    'Madhurai',
    'Kanayakumari',
    'Coimbatore',
    'Thanjavur',
    'Tirupur',
    'Madhurai',
    'Trichy',
    'Vellore',
    'Kameswaram',
    'Erode',
    'Kanchipuram',
    'Rameshwaram',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}