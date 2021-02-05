import 'package:asap_challenge_cubit/src/core/models/order.model.dart';
import 'package:flutter/material.dart';

class ResultsListViewWidget extends StatelessWidget {
  final List listOrders;
  const ResultsListViewWidget({
    Key key,
    this.listOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          color: Colors.white,
        ),
        itemCount: listOrders.length,
        itemBuilder: (context, index) {
          final OrderModel order = listOrders[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Stack(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '2 order with you',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              order.status,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            color: Color(0xff1C00CE),
                            textColor: Colors.white,
                            shape: StadiumBorder(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order ID: 9889788',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Address: 19A, Calle ljjh, Panama',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          OutlineButton(
                            onPressed: () {},
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textColor: Color(0xffffffff),
                            borderSide: BorderSide(color: Color(0xffffffff)),
                            highlightedBorderColor: Colors.white,
                            shape: StadiumBorder(),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      RichText(
                        text: TextSpan(
                          text: 'Delivery Time: 19 August,',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: ' 2020 5:90 PM',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
