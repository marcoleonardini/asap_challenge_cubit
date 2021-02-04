import 'package:flutter/material.dart';

class NoResultsListView extends StatelessWidget {
  const NoResultsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'No Results',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('assets/images/no_results.png'),
        ),
        SizedBox(height: 18.0),
        // SizedBox(height: 12.0),
        Icon(
          Icons.refresh,
          color: Colors.white,
          size: 16.0,
        ),
        Text(
          'Pull to refresh',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
