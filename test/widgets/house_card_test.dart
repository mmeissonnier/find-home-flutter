import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/models/price.dart';
import 'package:find_home/src/models/rating.dart';
import 'package:find_home/src/models/room.dart';
import 'package:find_home/src/models/user.dart';
import 'package:find_home/src/widgets/common/like_toggle_button.dart';
import 'package:find_home/src/widgets/house_card/house_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final HomeInfos home = HomeInfos(
      id: 1,
      name: 'Foo',
      price: const Price(value: 34, currencyCode: 'EUR', currencySymbol: '€'),
      rooms: [const Room(type: RoomType.bedroom, count: 1)],
      owner: User(
          firstName: 'John',
          lastName: 'Doe',
          id: 34,
          rating: const Rating(average: 4, total: 20)));
  group('HouseCard Widget', () {
    testWidgets('Test display', (tester) async {
      var pressed = false;
      onPressed(int id, bool selected) => pressed = (id == 1 && selected);

      createHouseCard() => Directionality(
          textDirection: TextDirection.ltr,
          child: HouseCard(data: home, onLiked: onPressed));

      await tester.pumpWidget(createHouseCard());
      expect(find.text('Foo'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('€34 EUR'), findsOneWidget);
      expect(find.text('20 votes'), findsOneWidget);

      await tester.tap(find.byType(LikeToggleButton));
      await tester.pumpAndSettle();
      expect(pressed, true);
    });
  });
}
