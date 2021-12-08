import 'package:find_home/src/models/location.dart';
import 'package:find_home/src/models/price.dart';
import 'package:find_home/src/models/room.dart';
import 'package:find_home/src/models/user.dart';

class HomeInfos {
  final int id;
  final String name;
  final Price price;
  final List<Room> rooms;
  final User owner;
  List<String> tags;
  String description;
  bool isFavorite;
  String pictureURL;
  Location location;

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
      List<String>? tags,
      String? description,
      Location? location})
      : pictureURL = pictureURL ?? '',
        isFavorite = isFavorite ?? false,
        tags = tags ?? [],
        location = location ?? const Location(),
        description = description ?? '';

  HomeInfos.fromJson(Map data)
      : id = int.parse(data['id'].toString()),
        name = data['name'] ?? '',
        price = Price.fromJson(data['price']),
        owner = User.fromJson(data['owner']),
        tags = List.from(['tags']),
        description = data['description'] ?? '',
        location = Location.fromJson(data['location']),
        isFavorite = data['isFavorite'] == true,
        pictureURL = data['pictureURL'] ?? '',
        rooms = HomeInfos.createRoomList(data);
}
