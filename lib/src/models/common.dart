class Location {
  final String city;
  final String state;

  const Location({required this.city, required this.state});
  Location.fromJson(Map<String, String> data)
      : city = data['city'] ?? '',
        state = data['state'] ?? '';
}

enum RoomType { bedroom, bathroom, kitchen }

class Room {
  final RoomType type;
  final int count;

  const Room({required this.type, required this.count});
}

class Price {
  final num value;
  final String currencyCode;
  final String currencySymbol;

  const Price(
      {required this.value,
      required this.currencyCode,
      required this.currencySymbol});
  Price.fromJson(Map data)
      : value = num.parse(data['value'].toString()),
        currencySymbol = data['currencySymbol'] ?? '',
        currencyCode = data['currencyCode'] ?? '';
}

class Rating {
  final num average;
  final int total;

  const Rating({required this.average, required this.total});
  Rating.fromJson(Map data)
      : average = num.parse(data['average'].toString()),
        total = int.parse(data['total'].toString());
}

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

class HomeInfos {
  final int id;
  final String name;
  final Price price;
  final List<Room> rooms;
  final User owner;
  bool? isFavorite;
  String? pictureURL;
  Location? location;

  static List<Room> createRoomList(Map data) {
    var list = List<Room>.empty(growable: true);
    list.add(Room(
        type: RoomType.bedroom, count: int.parse(data['bedrooms'].toString())));
    list.add(Room(
        type: RoomType.kitchen, count: int.parse(data['kitchens'].toString())));
    list.add(Room(
        type: RoomType.bathroom,
        count: int.parse(data['bathrooms'].toString())));

    return list;
  }

  HomeInfos(
      {required this.id,
      required this.name,
      required this.price,
      required this.rooms,
      required this.owner,
      bool? isFavorite,
      String? pictureURL,
      Location? location})
      : pictureURL = pictureURL ?? '',
        isFavorite = isFavorite ?? false;
  HomeInfos.fromJson(Map data)
      : id = int.parse(data['id'].toString()),
        name = data['name'] ?? '',
        price = Price.fromJson(data['price']),
        owner = User.fromJson(data['owner']),
        isFavorite = data['isFavorite'] == true,
        pictureURL = data['pictureURL'] ?? '',
        rooms = HomeInfos.createRoomList(data);
}
