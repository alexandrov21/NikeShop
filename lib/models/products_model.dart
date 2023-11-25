// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String photo;
  final String name;
  final String sizes;
  final String price;
  final String description;
  final String productId;
  final bool isSelect;

  ProductModel({
    required this.photo,
    required this.name,
    required this.sizes,
    required this.price,
    required this.description,
    this.isSelect = false,
    this.productId = '',
  });

  ProductModel.empty({
    this.photo = '',
    this.name = '',
    this.sizes = '',
    this.price = '',
    this.description = '',
    this.isSelect = false,
    this.productId = '',
  });

  ProductModel copyWith({
    String? photo,
    String? name,
    String? sizes,
    String? price,
    String? description,
    String? productId,
    bool? isSelect,
  }) {
    return ProductModel(
      photo: photo ?? this.photo,
      name: name ?? this.name,
      sizes: sizes ?? this.sizes,
      price: price ?? this.price,
      description: description ?? this.description,
      productId: productId ?? this.productId,
      isSelect: isSelect ?? this.isSelect,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
