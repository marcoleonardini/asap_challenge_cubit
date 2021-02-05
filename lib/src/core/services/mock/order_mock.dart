import 'package:asap_challenge_cubit/src/core/models/order.model.dart';
import 'package:asap_challenge_cubit/src/core/services/abstract/order_abstract.dart';
import 'dart:math' as math show Random;

class OrderMock implements OrderAbstract {
  @override
  Future<List<OrderModel>> getActiveOrders() {
    if (math.Random().nextDouble() * 100 > 25) {
      final List<OrderModel> list =
          _dataOrders.where((element) => element.status == 'Accepted').toList();
      list.shuffle();

      return Future.value(list);
    }
    return Future.value([]);
  }

  @override
  Future<List<OrderModel>> getPastOrders() {
    if (math.Random().nextDouble() * 100 > 25) {
      final List<OrderModel> list = _dataOrders
          .where((element) => element.status == 'Delivered')
          .toList();
      list.shuffle();

      return Future.value(list);
    }
    return Future.value([]);
  }

  final List<OrderModel> _dataOrders = [
    OrderModel(
      name: 'Sergei Plotnikof',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Accepted',
    ),
    OrderModel(
      name: 'Cesar Bentiez',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Accepted',
    ),
    OrderModel(
      name: 'Rossana De Alfaro',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Accepted',
    ),
    OrderModel(
      name: 'Hector Cotes',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Accepted',
    ),
    OrderModel(
      name: 'Sergei Plotnikof',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Delivered',
    ),
    OrderModel(
      name: 'Cesar Bentiez',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Delivered',
    ),
    OrderModel(
      name: 'Rossana De Alfaro',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Delivered',
    ),
    OrderModel(
      name: 'Hector Cotes',
      address: 'Address: 19A, Calle ljjh, Panama',
      deliveryTime: 'Order ID: 9889788',
      orderId: 9889788,
      status: 'Delivered',
    )
  ];
}
