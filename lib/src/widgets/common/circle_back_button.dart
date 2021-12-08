import 'package:flutter/material.dart';

class CircleBackButton extends StatefulWidget {
  final void Function()? onPressed;

  const CircleBackButton({Key? key, bool? selected, this.onPressed})
      : super(key: key);

  @override
  _CircleBackButtonState createState() => _CircleBackButtonState();
}

class _CircleBackButtonState extends State<CircleBackButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x1D288E12))],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ));
  }
}
