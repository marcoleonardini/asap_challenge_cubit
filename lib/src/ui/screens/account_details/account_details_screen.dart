import 'package:asap_challenge_cubit/src/ui/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatelessWidget {
  static const String route = 'account_details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff15018E),
        appBar: AppBar(
          backgroundColor: Color(0xff391B91),
          elevation: 0.0,
          title: Text('Account Details'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(24.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomFilledTextField(
                    text: '+1987898967489',
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.white70,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Info',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                  CustomFilledTextField(
                    text: 'Supermercado Rey',
                  ),
                  CustomFilledTextField(text: 'Supermercado Rey'),
                  CustomFilledTextField(text: 'Costadelestedelivery@gmail.com'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Verify Email'),
                        shape: StadiumBorder(),
                        color: Color(0xff1C00CE),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(
                              context, SplasScreen.route);
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Color(0xffffffff)),
                          padding: EdgeInsets.symmetric(horizontal: 36.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFilledTextField extends StatelessWidget {
  final String text;
  final Widget _suffixIcon;

  const CustomFilledTextField({
    Key key,
    Widget suffixIcon,
    @required this.text,
  })  : _suffixIcon = suffixIcon,
        super(key: key);

  const CustomFilledTextField.noSuffixIcon({
    Key key,
    Widget suffixIcon,
    @required this.text,
  })  : _suffixIcon = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(64.0),
      borderSide: BorderSide(
        color: Color(0xff391B91),
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: text),
        cursorColor: Colors.white,
        // TODO: Extract InputDecorations
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 24.0),
          fillColor: Color(0xff391B91),
          border: outlineInputBorderColor,
          enabledBorder: outlineInputBorderColor,
          focusedBorder: outlineInputBorderColor,
          suffixIcon: _suffixIcon ?? SizedBox.shrink(),
          filled: true,
        ),
      ),
    );
  }
}
