import 'package:find_home/src/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomItem extends StatelessWidget {
  final RoomType serviceType;
  final int value;
  final double iconSize;
  final Color iconColor;
  final TextStyle? textStyle;

  RoomItem(
      {Key? key,
      required this.serviceType,
      required this.value,
      double? iconSize,
      Color? iconColor,
      this.textStyle})
      : iconColor = iconColor ?? Colors.black38,
        iconSize = iconSize ?? 14,
        super(key: key);

  final serviceAssets = {
    RoomType.kitchen: 'assets/kitchen.svg',
    RoomType.bathroom: 'assets/sink.svg',
    RoomType.bedroom: 'assets/bed.svg'
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          serviceAssets[serviceType]!,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        Padding(
            padding: EdgeInsets.only(left: iconSize * 0.3),
            child: Text(
              value.toString(),
              style: textStyle?.copyWith(color: Colors.black38),
            ))
      ],
    );
  }
}
