import 'package:flutter/material.dart';

class LikeToggleButton extends StatefulWidget {
  final bool selected;
  final void Function(bool selected)? onPressed;

  const LikeToggleButton({Key? key, bool? selected, this.onPressed})
      : selected = selected ?? false,
        super(key: key);

  @override
  _LikeToggleButtonState createState() => _LikeToggleButtonState();
}

class _LikeToggleButtonState extends State<LikeToggleButton>
    with TickerProviderStateMixin {
  bool selected = false;
  late AnimationController _animationController;
  late Animation _scaleAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _scaleAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.6)
              .chain(CurveTween(curve: Curves.easeOutQuad)),
          weight: 10.0),
      TweenSequenceItem(
          tween: Tween(begin: 0.6, end: 1.0)
              .chain(CurveTween(curve: Curves.elasticOut)),
          weight: 90.0),
    ]).animate((CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 1.0))));

    setState(() {
      selected = widget.selected;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _animationController.reset();
          _animationController.forward();
          setState(() {
            selected = !selected;
          });
          if (widget.onPressed != null) {
            widget.onPressed!(selected);
          }
        },
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Color(0x1D288E12))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          selected ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.pink,
                          size: 20,
                        )),
                  ),
                )));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
