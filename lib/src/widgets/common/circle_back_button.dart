import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CircleBackButton extends StatefulWidget {
  final bool selected;
  final void Function(bool selected)? onPressed;

  const CircleBackButton({Key? key, bool? selected, this.onPressed})
      : selected = selected ?? false,
        super(key: key);

  @override
  _CircleBackButtonState createState() => _CircleBackButtonState();
}

class _CircleBackButtonState extends State<CircleBackButton> {
  bool selected = false;

  @override
  void initState() {
    setState(() {
      selected = widget.selected;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x1D288E12))],
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: PlatformIconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          selected ? Icons.favorite : Icons.favorite_outline,
          color: Colors.pink,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            selected = !selected;
            if (widget.onPressed != null) {
              widget.onPressed!(selected);
            }
          });
        },
      ),
    );
  }
}
