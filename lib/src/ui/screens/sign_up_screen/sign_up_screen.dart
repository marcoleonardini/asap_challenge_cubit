import 'package:asap_challenge_cubit/src/ui/screens/login_screen/login_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/sign_up_screen/sign_up_form.dart';
import 'package:asap_challenge_cubit/src/ui/utils/custom_linear_gradient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ValueNotifier<String> page = ValueNotifier('home');

class SignUpScreen extends StatelessWidget {
  static const String route = 'sign_up';

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
                        FormSignUp(),
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
              'Do you have an account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0),
            ),
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
              child: const Text(
                'Log In',
                textAlign: TextAlign.center,
                style: const TextStyle(
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
