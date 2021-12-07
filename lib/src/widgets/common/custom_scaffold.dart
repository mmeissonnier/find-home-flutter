import 'package:find_home/src/screens/details.dart';
import 'package:find_home/src/screens/home.dart';
import 'package:find_home/src/utils/transitions.dart';
import 'package:find_home/src/widgets/common/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  static const _navigatorKey = Key('__SCAFFOLD_NAVIGATOR__');
  static final HeroController _heroController = HeroController();

  final PlatformTabController _tabController = PlatformTabController();
  final List<BottomNavigationBarItem> items = BottomNavBar.buildNavBar();

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      bodyBuilder: (context, index) => index == 0
          ? HeroControllerScope(
              controller: _heroController,
              child: Navigator(
                key: _navigatorKey,
                onGenerateRoute: (settings) {
                  var routes = <String, WidgetBuilder>{
                    '/': (context) => const HomeScreen(),
                    '/details': (context) => DetailsScreen(
                          houseId: (settings.arguments as dynamic)['houseId'],
                        )
                  };

                  WidgetBuilder routeBuilder = routes[settings.name]!;
                  if (settings.name != '/details') {
                    return MaterialPageRoute(
                        builder: (context) => routeBuilder(context));
                  }

                  return slideUpwardRouteTransition(routeBuilder);
                },
              ))
          : Container(),
      items: items,
      pageBackgroundColor: Colors.white,
      tabController: _tabController,
    );
  }
}
