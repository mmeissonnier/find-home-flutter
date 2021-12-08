import 'package:find_home/src/controllers/house_list_controller.dart';
import 'package:find_home/src/globals.dart';
import 'package:find_home/src/widgets/house_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HouseListController _controller = HouseListController();

  @override
  void initState() {
    _controller.fetchHouseList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
            width: double.infinity,
            color: themeData.colorScheme.secondary,
            child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Eddie !',
                        style: themeData.textTheme.subtitle1!
                            .copyWith(color: Colors.white)),
                    Text('Start looking for your house',
                        style: themeData.textTheme.headline3!),
                  ],
                ))),
        Expanded(
          child: ChangeNotifierProvider.value(
              value: _controller.houseListModel,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: HouseCardList(
                    onLiked: (id, selected) {
                      _controller.updateFavorite(id, selected);
                    },
                    onCardPressed: (id) {
                      Navigator.pushNamed(context, '/details',
                          arguments: {'houseId': id});
                    },
                  ))),
        )
      ],
    );
  }
}
