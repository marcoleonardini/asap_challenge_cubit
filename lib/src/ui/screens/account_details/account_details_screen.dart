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
                  ),
                  Row(
                    children: [
                      Text('Personal Info'),
                      Icon(Icons.edit),
                    ],
                  ),
                  CustomFilledTextField(text: 'Supermercado Rey'),
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
                        onPressed: () {},
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
  const CustomFilledTextField({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: text),
        cursorColor: Colors.white,
        // TODO: Extract InputDecorations
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 24.0),
          fillColor: Color(0xff391B91),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64.0),
            borderSide: BorderSide(
              color: Color(0xff391B91),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64.0),
            borderSide: BorderSide(
              color: Color(0xff391B91),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64.0),
            borderSide: BorderSide(
              color: Color(0xff391B91),
            ),
          ),
          suffixIcon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          filled: true,
        ),
      ),
    );
  }
}
