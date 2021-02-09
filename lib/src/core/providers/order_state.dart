part of 'order_provider.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<OrderModel> order;
  const OrderLoaded(this.order);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OrderLoaded && o.order == order;
  }

  @override
  int get hashCode => order.hashCode;
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OrderError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
