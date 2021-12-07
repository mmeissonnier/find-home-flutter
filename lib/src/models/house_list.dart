import 'package:find_home/src/models/home_infos.dart';
import 'package:flutter/material.dart';

class HouseListModel extends ChangeNotifier {
  final List<HomeInfos> houseList = [];

  void add(HomeInfos house) {
    houseList.add(house);
    notifyListeners();
  }

  void set(List<HomeInfos> houses) {
    houseList.clear();
    houseList.addAll(houses);
    notifyListeners();
  }

  void updateFavorite(int id, bool selected) {
    var foundHome = houseList.singleWhere((element) => element.id == id);
    foundHome.isFavorite = selected;
    notifyListeners();
  }
}
