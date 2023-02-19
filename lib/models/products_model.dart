import 'package:flutter/material.dart';

class ProductsModel {
  final String photo;
  final String description;
  final String sizes;
  final String price;
  Color color = Colors.white;

  ProductsModel(
    this.photo,
    this.description,
    this.sizes,
    this.price,
  );
}
