import 'package:find_home/src/globals.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

class CustomDecoration {
  static InputDecoration material = const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 0)));
  static BoxDecoration cupertino = const BoxDecoration(
      color: Color(0xFFFFFFFF),
      boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x1D288E12))],
      borderRadius: BorderRadius.all(Radius.circular(5)));
}

class TextInputformField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? autocorrect;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final Widget? prefix;
  final String? label;

  final _lineHeight = 2.0;

  const TextInputformField(
      {Key? key,
      this.label,
      this.controller,
      this.validator,
      this.autocorrect,
      this.keyboardType,
      this.obscureText,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: themeData.textTheme.overline,
              )
            : Container(),
        PlatformTextFormField(
            validator: validator,
            controller: controller,
            autocorrect: autocorrect,
            obscureText: obscureText,
            style: themeData.textTheme.bodyText2,
            material: (_, __) => MaterialTextFormFieldData(
                decoration: CustomDecoration.material.copyWith(prefix: prefix)),
            cupertino: (_, __) => CupertinoTextFormFieldData(
                prefix: prefix,
                style: themeData.textTheme.bodyText2!
                    .copyWith(height: _lineHeight),
                decoration: CustomDecoration.cupertino),
            keyboardType: keyboardType),
      ],
    );
  }
}
