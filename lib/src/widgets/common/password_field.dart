import 'package:find_home/src/widgets/common/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? autocorrect;
  final FormFieldValidator<String>? validator;
  final String? label;

  const PasswordInputField(
      {Key? key, this.label, this.controller, this.autocorrect, this.validator})
      : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        TextInputformField(
          obscureText: isObscured,
          controller: widget.controller,
          autocorrect: widget.autocorrect,
          label: widget.label,
        ),
        PlatformIconButton(
          padding: const EdgeInsets.all(14),
          icon: Icon(
            isObscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color.fromARGB(80, 0, 0, 0),
          ),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        )
      ],
    );
  }
}
