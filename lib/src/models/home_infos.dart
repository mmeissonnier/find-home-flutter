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
