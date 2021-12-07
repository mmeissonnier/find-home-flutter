import 'package:find_home/src/models/room.dart';
import 'package:find_home/src/widgets/house_card/room_item.dart';
import 'package:flutter/material.dart';

class RoomsInfo extends StatelessWidget {
  final TextStyle? textStyle;
  final List<Room> rooms;

  const RoomsInfo({Key? key, this.textStyle, required this.rooms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rooms
          .map((room) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: RoomItem(
                serviceType: room.type,
                iconSize: 14,
                value: room.count,
                textStyle: textStyle,
              )))
          .toList(),
    );
  }
}
