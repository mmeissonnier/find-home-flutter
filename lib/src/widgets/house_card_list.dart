import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/models/house_list.dart';
import 'package:find_home/src/widgets/house_card/house_card.dart';
import 'package:find_home/src/globals.dart';
import 'package:find_home/src/widgets/house_card/house_card_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HouseCardList extends StatelessWidget {
  final void Function(int id, bool selected) onLiked;
  final void Function(int id)? onCardPressed;

  const HouseCardList({Key? key, required this.onLiked, this.onCardPressed})
      : super(key: key);

  Widget _buildHouseCard(HomeInfos data, BuildContext context) => SizedBox(
      height: 300,
      child: HouseCard(
          theme: themeData,
          data: data,
          onLiked: onLiked,
          footerBuilder: () => HouseCardFooter(
                theme: themeData,
                user: data.owner,
                rooms: data.rooms,
                name: data.name,
                price: data.price,
              ),
          onPressed: onCardPressed));

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseListModel>(
        builder: (context, value, child) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: value.houseList.length,
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.transparent,
                  height: 21,
                ),
            itemBuilder: (context, index) =>
                _buildHouseCard(value.houseList.elementAt(index), context)));
  }
}
