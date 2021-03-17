// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$_$_OrderModelFromJson(Map<String, dynamic> json) {
  return _$_OrderModel(
    name: json['name'] as String,
    orderId: json['orderId'] as int,
    address: json['address'] as String,
    deliveryTime: json['deliveryTime'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$_$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'orderId': instance.orderId,
      'address': instance.address,
      'deliveryTime': instance.deliveryTime,
      'status': instance.status,
    };
