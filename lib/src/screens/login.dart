import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:find_home/src/actions/user.dart';
import 'package:find_home/src/widgets/auth_form.dart';
import 'package:find_home/src/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _logo = SvgPicture.asset('assets/logo.svg');
  static final _shape = SvgPicture.asset('assets/home-upper-shape.svg',
      alignment: Alignment.bottomCenter);
  static final _scrollController = ScrollController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    EdgeInsets padding = data.padding;

    if (data.viewInsets.bottom != 0) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }

    return Scaffold(
        backgroundColor: colorScheme.surface,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
              padding: EdgeInsets.only(bottom: data.viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      color: colorScheme.secondary,
                      child: Padding(
                          padding: EdgeInsets.only(top: padding.top),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(40),
                                child: _logo,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  _shape,
                                  Column(
                                    children: [
                                      Text('Welcome',
                                          style: textTheme.headline1),
                                      Text('Login to enjoy FindHome',
                                          style: textTheme.subtitle1),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: AuthForm(
                      loading: isLoading,
                      onSubmit: (data) async {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          await logIn(data.username, data.password);
                          Navigator.pushReplacementNamed(context, '/home');
                        } catch (error) {
                          setState(() {
                            isLoading = false;
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return PlatformAlertDialog(
                                title: const Text('Error'),
                                content: Text(error.toString()),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              )),
        ),
        appBar: null);
  }
}
