import 'package:asap_challenge_cubit/src/core/services/firebase/auh_firebase.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/home_screen.dart';
import 'package:asap_challenge_cubit/src/ui/utils/text_field_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ValueNotifier<String> page = ValueNotifier('home');

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(body: Builder(
              // Create an inner BuildContext so that the onPressed methods
              // can refer to the Scaffold with Scaffold.of().
              builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  child: Container(
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff170146), Color(0xff1500A7)],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: 56,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Log in',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              // SizedBox(
                              //   height: 48.0,
                              // ),
                              Form(
                                key: _form,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        onSaved: (value) => email = value,
                                        style: TextStyle(color: Colors.white),
                                        cursorColor: Colors.grey,
                                        decoration: InputDecoration(
                                          focusColor: Colors.white,
                                          labelText: 'Email / mobile number',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        validator:
                                            TextFieldValidators.checkEmail,
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        onSaved: (value) => password = value,
                                        style: TextStyle(color: Colors.white),
                                        cursorColor: Colors.grey,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        validator:
                                            TextFieldValidators.checkPassword,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        'Forgot Password?',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                width: 200,
                                child: FlatButton(
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    _form.currentState.save();
                                    if (_form.currentState.validate()) {
                                      print(_form.currentState.toString());
                                      if (await AuthFirebase().logIn(
                                        email: email,
                                        password: password,
                                      )) {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          HomeScreen.route,
                                        );
                                      } else {
                                        print('wrong');

                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Email / Password incorrect'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Text('Login'),
                                  color: Color(0xff1C00CE),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Don\'t you have an account?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('signup');
                                  },
                                  child: Text(
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
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}
