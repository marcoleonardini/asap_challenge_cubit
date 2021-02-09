import 'package:asap_challenge_cubit/src/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:asap_challenge_cubit/src/ui/utils/custom_linear_gradient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:asap_challenge_cubit/src/ui/screens/login_screen/login_form.dart';

final ValueNotifier<String> page = ValueNotifier('home');

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  child: Container(
                    height: constraints.maxHeight,
                    decoration: AppLinearGradient.customBoxDecoration(),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: 56,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        FormLogin(),
                        const _BottomMessage(),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomMessage extends StatelessWidget {
  const _BottomMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Don\'t you have an account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0),
            ),
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignUpScreen.route);
              },
              child: const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
