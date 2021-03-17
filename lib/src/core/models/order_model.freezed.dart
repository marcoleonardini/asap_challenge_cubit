// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
class _$OrderModelTearOff {
  const _$OrderModelTearOff();

// ignore: unused_element
  _OrderModel call(
      {String name,
      int orderId,
      String address,
      String deliveryTime,
      String status}) {
    return _OrderModel(
      name: name,
      orderId: orderId,
      address: address,
      deliveryTime: deliveryTime,
      status: status,
    );
  }

// ignore: unused_element
  OrderModel fromJson(Map<String, Object> json) {
    return OrderModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $OrderModel = _$OrderModelTearOff();

/// @nodoc
mixin _$OrderModel {
  String get name;
  int get orderId;
  String get address;
  String get deliveryTime;
  String get status;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int orderId,
      String address,
      String deliveryTime,
      String status});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object name = freezed,
    Object orderId = freezed,
    Object address = freezed,
    Object deliveryTime = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      orderId: orderId == freezed ? _value.orderId : orderId as int,
      address: address == freezed ? _value.address : address as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
abstract class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) then) =
      __$OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int orderId,
      String address,
      String deliveryTime,
      String status});
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(
      _OrderModel _value, $Res Function(_OrderModel) _then)
      : super(_value, (v) => _then(v as _OrderModel));

  @override
  _OrderModel get _value => super._value as _OrderModel;

  @override
  $Res call({
    Object name = freezed,
    Object orderId = freezed,
    Object address = freezed,
    Object deliveryTime = freezed,
    Object status = freezed,
  }) {
    return _then(_OrderModel(
      name: name == freezed ? _value.name : name as String,
      orderId: orderId == freezed ? _value.orderId : orderId as int,
      address: address == freezed ? _value.address : address as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {this.name, this.orderId, this.address, this.deliveryTime, this.status});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderModelFromJson(json);

  @override
  final String name;
  @override
  final int orderId;
  @override
  final String address;
  @override
  final String deliveryTime;
  @override
  final String status;

  @override
  String toString() {
    return 'OrderModel(name: $name, orderId: $orderId, address: $address, deliveryTime: $deliveryTime, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.deliveryTime, deliveryTime) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryTime, deliveryTime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(deliveryTime) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderModelToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {String name,
      int orderId,
      String address,
      String deliveryTime,
      String status}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String get name;
  @override
  int get orderId;
  @override
  String get address;
  @override
  String get deliveryTime;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$OrderModelCopyWith<_OrderModel> get copyWith;
}
