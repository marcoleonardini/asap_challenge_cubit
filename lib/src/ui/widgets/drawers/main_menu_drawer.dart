import 'package:asap_challenge_cubit/src/ui/screens/account_details/account_details_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Supermercado Rey',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '+879696897056',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              backgroundColor: Color(0xff391B91),
              elevation: 0.0,
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AccountDetailsScreen.route);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(width: 24.0)
              ],
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Menus'),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                )
              ],
            ),
            _IconTextRow(
              icon: Icon(Icons.food_bank_rounded),
              text: 'Ordenes de menus',
            ),
            _IconTextRow(
              icon: Icon(Icons.fastfood),
              text: 'Elementos de menu',
            ),
            Text('My orders'),
            _IconTextRow(
              icon: Icon(Icons.shopping_bag_rounded),
              text: 'New Delivery',
            ),
            _IconTextRow(
              icon: Icon(Icons.delivery_dining),
              text: 'My Orders',
            ),
            _IconTextRow(
              icon: Icon(Icons.account_balance_wallet),
              text: 'Wallet',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconTextRow extends StatelessWidget {
  final Icon icon;
  final String text;
  const _IconTextRow({
    Key key,
    @required this.icon,
    @required this.text,
  })  : assert(icon != null),
        assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: Row(
        children: [
          Expanded(child: icon),
          Expanded(
            flex: 3,
            child: Text(text),
          )
        ],
      ),
    );
  }
}
