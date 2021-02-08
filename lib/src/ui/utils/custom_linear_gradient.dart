import 'package:flutter/widgets.dart';

class AppLinearGradient {
  static BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff170146), Color(0xff1500A7)],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      ),
    );
  }
}
