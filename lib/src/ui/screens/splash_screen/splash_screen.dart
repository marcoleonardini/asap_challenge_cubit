import 'package:asap_challenge_cubit/src/ui/screens/home_screen/home_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              Expanded(flex: 2, child: HomeWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  double opacity = 0.0;
  bool islogged = false;

  String email = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await isLoggedIn(context);
  }

  Future<void> isLoggedIn(context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        email = FirebaseAuth.instance.currentUser.email;
        opacity = 1;
        islogged = true;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      return Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    }
    setState(() {
      opacity = 1;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: islogged
          ? WelcomeBackLabel(
              email: email,
            )
          : ButtonsWidget(),
    );
  }
}

class WelcomeBackLabel extends StatelessWidget {
  final String email;

  const WelcomeBackLabel({Key key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Welcome back!',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 8.0),
          Text(
            email,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
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
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Color(0xffffffff)),
            ),

            // highlightedBorderColor: Colors.white,
            onPressed: () {},
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
            //textColor: Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
