import 'package:asap_challenge_cubit/src/core/models/order.model.dart';

abstract class OrderAbstract {
  Future<List<OrderModel>> getActiveOrders();
  Future<List<OrderModel>> getPastOrders();
}
