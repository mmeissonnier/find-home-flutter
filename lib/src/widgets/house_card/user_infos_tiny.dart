import 'package:find_home/src/models/rating.dart';
import 'package:find_home/src/models/user.dart';
import 'package:find_home/src/widgets/house_card/rating_stars.dart';
import 'package:flutter/material.dart';

class UserInfosTiny extends StatelessWidget {
  final User user;
  final ThemeData? theme;

  const UserInfosTiny({Key? key, required this.user, this.theme})
      : super(key: key);

  final _imageSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_imageSize * 0.5)),
            child: Image.network(
              user.avatarURL,
              width: _imageSize,
              height: _imageSize,
              fit: BoxFit.cover,
              alignment: AlignmentDirectional.center,
              errorBuilder: (context, error, stackTrace) => const Text('😢'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              '${user.firstName} ${user.lastName}',
              style: theme?.textTheme.bodyText2,
            ),
          )
        ]),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingStars(
              starActiveColor: theme?.colorScheme.secondary,
              rating: Rating(
                  average: user.rating.average, total: user.rating.total),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${user.rating.total} votes',
                  style: theme?.textTheme.caption,
                ))
          ],
        )
      ],
    ));
  }
}
