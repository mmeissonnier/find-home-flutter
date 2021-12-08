import 'package:find_home/src/models/price.dart';
import 'package:find_home/src/models/room.dart';
import 'package:find_home/src/models/user.dart';
import 'package:find_home/src/widgets/house_card/rooms_info.dart';
import 'package:find_home/src/widgets/house_card/user_infos_tiny.dart';
import 'package:flutter/material.dart';

class HouseCardFooter extends StatelessWidget {
  final User user;
  final List<Room> rooms;
  final Price price;
  final String name;
  final ThemeData? theme;

  const HouseCardFooter(
      {Key? key,
      required this.user,
      required this.rooms,
      required this.name,
      required this.price,
      this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      name,
                      style: theme?.textTheme.headline3,
                    )),
                UserInfosTiny(
                  user: user,
                  theme: theme,
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(
                      '${price.currencySymbol}${price.value} ${price.currencyCode}',
                      style: theme?.textTheme.headline2,
                    )),
                RoomsInfo(
                  textStyle: theme?.textTheme.bodyText1,
                  rooms: rooms,
                )
              ],
            )
          ],
        ));
  }
}
