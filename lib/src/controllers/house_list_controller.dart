import 'dart:convert';

import 'package:find_home/src/actions/houses.dart';
import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/models/house_list.dart';

class HouseListController {
  static final HouseListController _instance = HouseListController._internal();

  factory HouseListController() => _instance;

  HouseListController._internal();

  final HouseListModel houseListModel = HouseListModel();

  void fetchHouseList() async {
    var response = await getHouseList();
    var data = jsonDecode(response.body);

    assert(data != null && data['houselist'] != null);

    var houseList = List.from(data['houselist'])
        .map((item) => HomeInfos.fromJson(item))
        .toList();
    houseListModel.set(houseList);
  }

  void updateFavorite(int id, bool selected) {
    houseListModel.updateFavorite(id, selected);
  }

  void dispose() {
    houseListModel.dispose();
  }
}
