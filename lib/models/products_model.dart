import 'package:flutter/material.dart';

class ProductsModel {
  final String photo;
  final String name;
  final String sizes;
  final String price;
  final String description;
  Color color = Colors.white;

  ProductsModel(
    this.photo,
    this.name,
    this.sizes,
    this.price,
    this.description,
  );

  ProductsModel.empty({
    this.photo = '',
    this.name = '',
    this.sizes = '',
    this.price = '',
    this.description = '',
  });
}
