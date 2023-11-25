// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      photo: json['photo'] as String,
      name: json['name'] as String,
      sizes: json['sizes'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      isSelect: json['isSelect'] as bool? ?? false,
      productId: json['productId'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'name': instance.name,
      'sizes': instance.sizes,
      'price': instance.price,
      'description': instance.description,
      'productId': instance.productId,
      'isSelect': instance.isSelect,
    };
