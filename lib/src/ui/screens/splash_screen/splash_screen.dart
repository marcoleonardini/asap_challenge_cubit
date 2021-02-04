import 'package:asap_challenge_cubit/src/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff170146), Color(0xff1500A7)],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 56,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                    'assets/images/gift_pana.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: HomeWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.route);
            },
            child: Text('Login'),
            color: Color(0xff1C00CE),
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ),
        SizedBox(
          width: 200,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Sign Up'),
            textColor: Color(0xffffffff),
            borderSide: BorderSide(color: Color(0xffffffff)),
            highlightedBorderColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ),
      ],
    );
  }
}
