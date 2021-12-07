import 'package:find_home/src/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends PlatformNavBar {
  static Widget _getAssetIcon(String name, {Color color = Colors.black12}) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SvgPicture.asset('assets/$name.svg', color: color));
  }

  static List<BottomNavigationBarItem> buildNavBar() =>
      ['menu-home', 'menu-favorites', 'menu-locations', 'menu-chat']
          .map((id) => BottomNavigationBarItem(
              icon: _getAssetIcon(id),
              label: '',
              activeIcon:
                  _getAssetIcon(id, color: themeData.colorScheme.secondary)))
          .toList();

  BottomNavBar({Key? key})
      : super(key: key, backgroundColor: Colors.white, items: buildNavBar());
}
