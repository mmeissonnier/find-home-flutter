import 'package:find_home/src/models/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingStars extends StatelessWidget {
  final Rating rating;
  final double starSize;
  final Color starActiveColor;

  RatingStars(
      {Key? key,
      required this.rating,
      Color? starActiveColor,
      double? starSize})
      : starSize = starSize ?? 12.0,
        starActiveColor = starActiveColor ?? Colors.yellow,
        super(key: key);

  final _colorInactive = Colors.black12;
  final _maxStars = 5;

  _buildStars() {
    return List.generate(
        _maxStars,
        (index) => Padding(
            padding: EdgeInsets.only(right: (starSize / 3)),
            child: SvgPicture.asset('assets/star.svg',
                width: starSize,
                height: starSize,
                color: index < rating.average
                    ? starActiveColor
                    : _colorInactive)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: _buildStars(),
    );
  }
}
