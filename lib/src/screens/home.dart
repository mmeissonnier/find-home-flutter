import 'package:find_home/src/controllers/house_list_controller.dart';
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
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: Text(
          'Welcome John !',
          style: Theme.of(context).textTheme.headline1,
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ChangeNotifierProvider.value(
              value: _controller.houseListModel,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: HouseCardList(
                    onLiked: (id, selected) {
                      _controller.updateFavorite(id, selected);
                    },
                    onCardPressed: (id) {
                      Navigator.pushNamed(context, '/details',
                          arguments: {'houseId': id});
                    },
                  )),
            ))
      ],
    ));
  }
}
