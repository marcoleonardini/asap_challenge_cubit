part of 'order_provider.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.loaded({
    @required List<OrderModel> ordersList,
  }) = _Loaded;
  const factory OrderState.error() = _Error;
}
