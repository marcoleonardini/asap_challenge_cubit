import 'package:asap_challenge_cubit/src/core/services/firebase/auh_firebase.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/home_screen.dart';
import 'package:asap_challenge_cubit/src/ui/utils/text_field_validators.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
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
                  'Sign Up',
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
                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () => _doSignUp(context: context),
                    child: Text('Sign Up'),
                    color: Color(0xff1C00CE),
                    shape: StadiumBorder(),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, _) {
                    if (value) return CircularProgressIndicator();
                    return SizedBox.shrink();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _doSignUp({BuildContext context}) async {
    FocusScope.of(context).unfocus();
    _form.currentState.save();
    if (_form.currentState.validate()) {
      isLoading.value = true;
      if (await AuthFirebase().signUp(
        email: email,
        password: password,
      )) {
        Navigator.pushReplacementNamed(
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
