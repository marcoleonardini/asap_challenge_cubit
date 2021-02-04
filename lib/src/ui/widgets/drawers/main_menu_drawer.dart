import 'package:flutter/material.dart';

class MainMenuDrawer extends StatelessWidget {
  const MainMenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: 250,
        alignment: Alignment.topLeft,
        color: Color(0xff15018E),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.chevron_left_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Color(0xff391B91),
              elevation: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
