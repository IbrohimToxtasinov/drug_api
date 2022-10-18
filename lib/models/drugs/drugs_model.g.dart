// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugsModel _$DrugsModelFromJson(Map<String, dynamic> json) => DrugsModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$DrugsModelToJson(DrugsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
    };
