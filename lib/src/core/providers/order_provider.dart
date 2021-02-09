import 'package:asap_challenge_cubit/src/core/models/order.model.dart';
import 'package:asap_challenge_cubit/src/core/services/mock/order_mock.dart';
import 'package:bloc/bloc.dart';

part 'order_state.dart';

class OrderProvider extends Cubit<OrderState> {
  List<OrderModel> _activeOrders = [];
  List<OrderModel> _pastOrders = [];
  OrderProvider() : super(OrderInitial()) {
    refreshActiveOrders();
  }
  void getActiveOrders() async {
    try {
      emit(OrderLoaded(_activeOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  void getPastOrders() async {
    try {
      emit(OrderLoaded(_pastOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  Future<void> refreshActiveOrders() async {
    try {
      emit(OrderLoading());
      _activeOrders = await OrderMock().getActiveOrders();
      emit(OrderLoaded(_activeOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  Future<void> refreshPastOrders() async {
    try {
      emit(OrderLoading());
      _pastOrders = await OrderMock().getPastOrders();
      emit(OrderLoaded(_pastOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  void cleanOrders() {
    _pastOrders = _activeOrders = [];
  }
}
