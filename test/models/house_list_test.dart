import 'package:find_home/src/models/house_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:find_home/src/models/common.dart';

void main() {
  HomeInfos home = HomeInfos(
      id: 1,
      name: 'Foo',
      price: const Price(value: 34, currencyCode: 'EUR', currencySymbol: '€'),
      rooms: [const Room(type: RoomType.bedroom, count: 1)],
      owner: User(
          firstName: 'John',
          lastName: 'Doe',
          id: 34,
          rating: const Rating(average: 4, total: 20)));
  group('HouseListModel', () {
    var model = HouseListModel();

    test('Set house list', () {
      model.set([home]);
      expect(model.houseList.contains(home), true);
    });

    test('Update favorite', () {
      model.updateFavorite(home.id, true);
      expect(
          model.houseList
              .singleWhere((element) => element.id == home.id)
              .isFavorite,
          true);
    });

    test('Add element', () {
      HomeInfos newHome = HomeInfos(
          id: 2,
          name: 'Bar',
          price:
              const Price(value: 100, currencyCode: 'EUR', currencySymbol: '€'),
          rooms: [const Room(type: RoomType.bedroom, count: 1)],
          owner: User(
              firstName: 'Bill',
              lastName: 'Gates',
              id: 56,
              rating: const Rating(average: 3, total: 60)));

      model.add(newHome);
      expect(model.houseList.contains(newHome), true);
    });
  });
}
