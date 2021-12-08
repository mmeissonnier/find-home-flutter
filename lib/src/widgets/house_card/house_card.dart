import 'package:find_home/src/models/home_infos.dart';
import 'package:find_home/src/widgets/common/like_toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HouseCard extends StatelessWidget {
  final HomeInfos data;
  final ThemeData? theme;
  final Widget Function()? footerBuilder;
  final void Function(int id, bool selected)? onLiked;
  final void Function(int id)? onPressed;

  const HouseCard(
      {Key? key,
      required this.data,
      this.theme,
      this.onLiked,
      this.onPressed,
      this.footerBuilder})
      : super(key: key);

  Color getColor(Set<MaterialState> states) {
    return Colors.transparent;
  }

  Widget _imageWrapper({required Widget child}) => onPressed != null
      ? CupertinoButton(
          padding: const EdgeInsets.only(top: 90),
          color: Colors.transparent,
          onPressed: () {
            if (onPressed != null) {
              onPressed!(data.id);
            }
          },
          child: child)
      : Padding(padding: const EdgeInsets.only(top: 90), child: child);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'house-card-${data.id}',
        transitionOnUserGestures: true,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Transform.translate(
              offset: const Offset(0, -90),
              child: _imageWrapper(
                  child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  data.pictureURL,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('😢'),
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) =>
                          Stack(children: [
                    Visibility(
                        visible: frame == null,
                        child: Container(
                            child: const CircularProgressIndicator(),
                            height: 260,
                            alignment: Alignment.center,
                            color: const Color.fromARGB(5, 0, 0, 0))),
                    AnimatedOpacity(
                      child: child,
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    )
                  ]),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: AlignmentDirectional.center,
                ),
              ))),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:
                      footerBuilder != null ? footerBuilder!() : Container()),
              Transform.translate(
                  offset: const Offset(-30, 0),
                  child: LikeToggleButton(
                    selected: data.isFavorite,
                    onPressed: (selected) {
                      if (onLiked != null) {
                        onLiked!(data.id, selected);
                      }
                    },
                  ))
            ],
          )
        ]));
  }
}
