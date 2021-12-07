import 'package:find_home/src/models/rating.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  Rating rating;
  String avatarURL;
  List<int> favorites;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      Rating? rating,
      List<int>? favorites,
      String? avatarURL})
      : favorites = favorites ?? List.empty(growable: true),
        avatarURL = avatarURL ?? '',
        rating = rating ?? const Rating(average: 0, total: 0);
  User.fromJson(Map data)
      : id = int.parse(data['id'].toString()),
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        favorites = List.from(data['favorites'] ?? []),
        avatarURL = data['avatarURL'] ?? '',
        rating = Rating.fromJson(data['rating']);
}
