import 'package:find_home/src/models/home_infos.dart';
import 'package:flutter/material.dart';
import 'package:find_home/src/globals.dart';

class HouseDetails extends StatelessWidget {
  final HomeInfos data;
  const HouseDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Hero(
        tag: 'house-image-${data.id}',
        transitionOnUserGestures: true,
        child: Image.network(
          data.pictureURL ?? '',
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) => const Text('😢'),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              frame == null
                  ? Container(
                      child: const CircularProgressIndicator(),
                      alignment: Alignment.center,
                      color: const Color.fromARGB(5, 0, 0, 0))
                  : AnimatedOpacity(
                      child: child,
                      opacity: 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                    ),
          fit: BoxFit.cover,
          alignment: AlignmentDirectional.center,
        ),
      )),
      Expanded(
          child: AnimatedSlide(
              duration: const Duration(seconds: 1),
              offset: const Offset(0, -0.2),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.background,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
              )))
    ]);
  }
}
