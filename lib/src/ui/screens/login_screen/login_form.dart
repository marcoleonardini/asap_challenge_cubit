import 'package:asap_challenge_cubit/src/core/const/app_colors.dart';
import 'package:asap_challenge_cubit/src/core/services/firebase/auh_firebase.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/home_screen.dart';
import 'package:asap_challenge_cubit/src/ui/utils/text_field_validators.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  ValueNotifier isLoading = ValueNotifier(false);

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                Text(
                  'Log in',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    onSaved: (value) => email = value,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      focusColor: Theme.of(context).textTheme.bodyText1.color,
                      labelText: 'Email / mobile number',
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                    validator: TextFieldValidators.checkEmail,
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    onSaved: (value) => password = value,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                    cursorColor: Colors.grey,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                    validator: TextFieldValidators.checkPassword,
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
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, _) {
                    if (value) return CircularProgressIndicator();
                    return SizedBox(
                      width: 200,
                      child: RaisedButton(
                        onPressed: () => _doLogin(context: context),
                        child: Text('Login'),
                        color: AppColors.blueButtonColor,
                        shape: StadiumBorder(),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _doLogin({BuildContext context}) async {
    FocusScope.of(context).unfocus();
    _form.currentState.save();
    if (_form.currentState.validate()) {
      isLoading.value = true;
      if (await AuthFirebase().logIn(
        email: email,
        password: password,
      )) {
        await Navigator.pushReplacementNamed(
          context,
          HomeScreen.route,
        );
      } else {
        isLoading.value = false;
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Email / Password incorrect'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }
}
