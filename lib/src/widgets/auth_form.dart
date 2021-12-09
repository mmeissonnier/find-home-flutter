import 'package:find_home/src/widgets/common/password_field.dart';
import 'package:find_home/src/widgets/common/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:find_home/src/globals.dart';

class FormData {
  late String username;
  late String password;
}

class AuthForm extends StatefulWidget {
  final bool loading;

  const AuthForm({
    Key? key,
    this.loading = false,
    required this.onSubmit,
  }) : super(key: key);

  final void Function(FormData) onSubmit;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 7),
            child: TextInputformField(
              label: 'Username',
              controller: _usernameController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'This field is required'),
                EmailValidator(errorText: 'Wrong email format')
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 29, right: 29),
            child: PasswordInputField(
              controller: _passwordController,
              label: 'Password',
              autocorrect: false,
              validator: RequiredValidator(errorText: 'This field is required'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40, left: 29, right: 29),
              child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: PlatformElevatedButton(
                    cupertino: (_, __) => CupertinoElevatedButtonData(
                      originalStyle: true,
                      color: themeData.colorScheme.primary,
                    ),
                    child: widget.loading
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : Text(
                            'Login'.toUpperCase(),
                            style: themeData.textTheme.button,
                          ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var data = FormData();
                        data.username = _usernameController.text;
                        data.password = _passwordController.text;

                        widget.onSubmit(data);
                      }
                    },
                  )))
        ],
      ),
    );
  }
}
