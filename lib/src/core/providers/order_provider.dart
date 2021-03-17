import 'package:asap_challenge_cubit/src/core/models/order_model.dart';
import 'package:asap_challenge_cubit/src/core/services/mock/order_mock.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_provider.freezed.dart';
part 'order_state.dart';

class OrderProvider extends Cubit<OrderState> {
  List<OrderModel> _activeOrders = [];
  List<OrderModel> _pastOrders = [];

  OrderProvider() : super(OrderState.initial()) {
    refreshActiveOrders();
  }
  void getActiveOrders() async {
    try {
      emit(OrderState.loaded(ordersList: _activeOrders));
    } on NetworkException {
      emit(OrderState.error());
    }
  }

  void getPastOrders() async {
    try {
      emit(OrderState.loaded(ordersList: _pastOrders));
    } on NetworkException {
      emit(OrderState.error());
    }
  }

  Future<void> refreshActiveOrders() async {
    try {
      emit(OrderState.loading());
      _activeOrders = await OrderMock().getActiveOrders();
      emit(OrderState.loaded(ordersList: _activeOrders));
    } on NetworkException {
      emit(OrderState.error());
    }
  }

  Future<void> refreshPastOrders() async {
    try {
      emit(OrderState.loading());
      _pastOrders = await OrderMock().getPastOrders();
      emit(OrderState.loaded(ordersList: _pastOrders));
    } on NetworkException {
      emit(OrderState.error());
    }
  }

  void cleanOrders() {
    _pastOrders = _activeOrders = [];
  }
}
