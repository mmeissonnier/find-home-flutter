import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/widgets/house_card/rooms_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HouseFullInfos extends StatelessWidget {
  final ThemeData? theme;
  final HomeInfos data;
  const HouseFullInfos({Key? key, this.theme, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    data.name,
                    style: theme?.textTheme.headline4,
                  )),
              SizedBox(
                  width: 205,
                  child: RoomsInfo(
                    textStyle:
                        theme?.textTheme.bodyText1!.copyWith(fontSize: 19),
                    rooms: data.rooms,
                    iconSize: 20,
                    iconColor: theme?.colorScheme.secondary,
                  )),
              const Divider(),
              Text(
                'Description',
                style: theme?.textTheme.headline2,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 18),
                  child: Text(
                    data.description,
                    maxLines: 5,
                    style: theme?.textTheme.bodyText2!
                        .copyWith(color: Colors.black38),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${data.price.currencySymbol}${data.price.value} ${data.price.currencyCode}',
                      style: theme?.textTheme.headline2),
                  PlatformElevatedButton(
                    child: const Text('Reserve now'),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    material: (_, __) => MaterialElevatedButtonData(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => theme?.colorScheme.secondary))),
                    cupertino: (_, __) => CupertinoElevatedButtonData(
                        originalStyle: true,
                        color: theme?.colorScheme.secondary),
                    onPressed: () {
                      print('ON PRESSED');
                    },
                  )
                ],
              )
            ]));
  }
}
