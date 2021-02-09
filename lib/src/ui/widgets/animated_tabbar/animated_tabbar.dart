import 'package:flutter/material.dart';

class AnimatedTabbar extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String value1;
  final String value2;
  const AnimatedTabbar({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.value1,
    @required this.value2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.decelerate,
        decoration: value1 == value2
            ? BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xff160046),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.transparent,
              ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Text('Active Orders'),
      ),
    );
  }
}
