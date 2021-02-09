import 'package:asap_challenge_cubit/src/core/const/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppLinearGradient {
  static BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.beginGradientColor,
          AppColors.endGradientColor,
        ],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      ),
    );
  }
}
