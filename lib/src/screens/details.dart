import 'package:find_home/src/controllers/house_list_controller.dart';
import 'package:find_home/src/globals.dart';
import 'package:find_home/src/widgets/house_details/house_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final num houseId;
  const DetailsScreen({Key? key, required this.houseId}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final HouseListController _controller = HouseListController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _controller.houseListModel,
        child: HouseDetails(
            theme: themeData,
            onLiked: (id, selected) {
              _controller.updateFavorite(id, selected);
            },
            data: _controller.houseListModel.houseList
                .singleWhere((element) => element.id == widget.houseId)));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
