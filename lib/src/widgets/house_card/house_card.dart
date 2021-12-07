import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/widgets/house_card/house_card_footer.dart';
import 'package:find_home/src/widgets/common/like_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HouseCard extends StatelessWidget {
  final HomeInfos data;
  final ThemeData? theme;
  final void Function(int id, bool selected) onLiked;
  final void Function(int id)? onPressed;

  const HouseCard(
      {Key? key,
      required this.data,
      this.theme,
      required this.onLiked,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 350,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Transform.translate(
              offset: const Offset(0, -90),
              child: PlatformElevatedButton(
                  padding: EdgeInsets.zero,
                  cupertino: (_, __) => CupertinoElevatedButtonData(
                      color: Colors.transparent, originalStyle: true),
                  onPressed: () {
                    if (onPressed != null) {
                      onPressed!(data.id);
                    }
                  },
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Hero(
                        tag: 'house-image-${data.id}',
                        transitionOnUserGestures: true,
                        child: Image.network(
                          data.pictureURL ?? '',
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('😢'),
                          frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) =>
                              frame == null
                                  ? Container(
                                      child: const CircularProgressIndicator(),
                                      height: 260,
                                      alignment: Alignment.center,
                                      color: const Color.fromARGB(5, 0, 0, 0))
                                  : AnimatedOpacity(
                                      child: child,
                                      opacity: 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeOut,
                                    ),
                          fit: BoxFit.cover,
                          height: 260,
                          width: double.infinity,
                          alignment: AlignmentDirectional.center,
                        ),
                      )))),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: HouseCardFooter(
                    theme: theme,
                    user: data.owner,
                    rooms: data.rooms,
                    name: data.name,
                    price: data.price,
                    onPressLike: (selected) {
                      onLiked(data.id, selected);
                    },
                  )),
              Transform.translate(
                  offset: const Offset(-30, 0),
                  child: LikeToggleButton(
                    selected: data.isFavorite,
                    onPressed: (selected) {
                      onLiked(data.id, selected);
                    },
                  ))
            ],
          )
        ]));
  }
}
