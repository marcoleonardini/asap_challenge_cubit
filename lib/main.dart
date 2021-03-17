import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asap_challenge_cubit/src/core/providers/order_provider.dart';
import 'package:asap_challenge_cubit/src/core/config/routes.dart';
import 'package:asap_challenge_cubit/src/ui/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderProvider>(
      create: (_) => OrderProvider(),
      child: MaterialApp(
        title: 'ASAP Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.black, //  <-- dark color
            textTheme: ButtonTextTheme
                .primary, //  <-- this auto selects the right color
          ),
          iconTheme: const IconThemeData(color: Colors.white70),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.white70),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
            headline2: TextStyle(),
            headline3: TextStyle(),
            headline6: TextStyle(),
            subtitle1: TextStyle(),
            subtitle2: TextStyle(),
          ).apply(
            bodyColor: Colors.white70,
            displayColor: Colors.white70,
          ),
        ),
        initialRoute: SplasScreen.route,
        onGenerateRoute: AppRoute.getRoutes,
      ),
    );
  }
}
