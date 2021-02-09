import 'package:asap_challenge_cubit/src/core/models/order.model.dart';
import 'package:asap_challenge_cubit/src/core/services/mock/order_mock.dart';
import 'package:bloc/bloc.dart';

part 'order_state.dart';

class OrderProvider extends Cubit<OrderState> {
  List<OrderModel> activeOrders = [];
  List<OrderModel> pastOrders = [];
  OrderProvider() : super(OrderInitial()) {
    refreshActiveOrders();
  }
  Future<void> getActiveOrders() async {
    try {
      emit(OrderLoaded(activeOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  Future<void> getPastOrders() async {
    try {
      emit(OrderLoaded(pastOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  Future<void> refreshActiveOrders() async {
    try {
      emit(OrderLoading());
      activeOrders = await OrderMock().getActiveOrders();
      emit(OrderLoaded(activeOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }

  Future<void> refreshPastOrders() async {
    try {
      emit(OrderLoading());
      pastOrders = await OrderMock().getPastOrders();
      emit(OrderLoaded(pastOrders));
    } on NetworkException {
      emit(OrderError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
