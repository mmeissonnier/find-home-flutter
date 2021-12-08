import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/widgets/common/circle_back_button.dart';
import 'package:find_home/src/widgets/house_card/house_card.dart';
import 'package:find_home/src/widgets/house_details/house_full_infos.dart';
import 'package:flutter/material.dart';
import 'package:find_home/src/globals.dart';

class HouseDetails extends StatelessWidget {
  final HomeInfos data;
  final ThemeData? theme;
  final void Function(int id, bool selected)? onLiked;
  const HouseDetails({Key? key, required this.data, this.theme, this.onLiked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      HouseCard(
        data: data,
        theme: themeData,
        onLiked: onLiked,
        footerBuilder: () => HouseFullInfos(theme: theme, data: data),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 50, left: 25),
          child: CircleBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    ]);
  }
}
