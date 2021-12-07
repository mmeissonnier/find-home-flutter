enum RoomType { bedroom, bathroom, kitchen }

class Room {
  final RoomType type;
  final int count;

  const Room({required this.type, required this.count});
}
