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
    'சென்னை',
    'மதுரை',
    'கனாயகுமாரி',
    'கோவையில்',
    'தஞ்சாவூர்',
    'திருப்பூர்',
    'மதுரை',
    'திருச்சி',
    'வேலூர்',
    'காமேஸ்வரம்',
    'ஈரோட்',
    'காஞ்சிபுரம்',
    'ராமேஸ்வரம்',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}