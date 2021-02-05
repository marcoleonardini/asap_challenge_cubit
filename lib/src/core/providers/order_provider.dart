import 'package:asap_challenge_cubit/src/core/services/mock/order_mock.dart';
import 'package:bloc/bloc.dart';

class OrderProvider extends Cubit<List> {
  OrderProvider() : super([]);

  void getActiveOrders() async {
    final List activeOrdes = await OrderMock().getActiveOrders();
    emit(activeOrdes);
  }

  void getPastOrders() async {
    final List pastOrdes = await OrderMock().getPastOrders();
    emit(pastOrdes);
  }
}
