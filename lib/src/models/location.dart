class Location {
  final String city;
  final String state;

  const Location({required this.city, required this.state});
  Location.fromJson(Map<String, String> data)
      : city = data['city'] ?? '',
        state = data['state'] ?? '';
}
