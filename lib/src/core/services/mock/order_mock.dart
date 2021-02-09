import 'package:asap_challenge_cubit/src/core/models/order.model.dart';
import 'package:asap_challenge_cubit/src/core/services/abstract/order_abstract.dart';
import 'dart:math' as math show Random;
import 'fake_order_data.dart';

class OrderMock implements OrderAbstract {
  @override
  Future<List<OrderModel>> getActiveOrders() async {
    await Future.delayed(const Duration(milliseconds: 1250));
    if (math.Random().nextDouble() * 100 > 15) {
      final list =
          dataOrders.where((element) => element.status == 'Accepted').toList();
      list.shuffle();

      return Future.value(list);
    }
    return Future.value([]);
  }

  @override
  Future<List<OrderModel>> getPastOrders() async {
    await Future.delayed(const Duration(milliseconds: 1250));
    if (math.Random().nextDouble() * 100 > 15) {
      final list =
          dataOrders.where((element) => element.status == 'Delivered').toList();
      list.shuffle();

      return Future.value(list);
    }
    return Future.value([]);
  }
}

class NetworkException implements Exception {}
