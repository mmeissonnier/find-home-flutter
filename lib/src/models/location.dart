class Location {
  final String city;
  final String state;

  const Location({String? city, String? state})
      : city = city ?? '',
        state = state ?? '';

  Location.fromJson(Map data)
      : city = data['city'] ?? '',
        state = data['state'] ?? '';
}
