import 'package:flutter/material.dart';

import '../models/products_options_model.dart';

abstract class ProductDetailMock {
  static List<ProductsOptionsModel> options = [
    ProductsOptionsModel(
      Icons.house_outlined,
      'Availability in stores',
    ),
    ProductsOptionsModel(
      Icons.messenger_outline,
      'Reviews',
    ),
    ProductsOptionsModel(
      Icons.question_answer_outlined,
      'Questions and answers',
    ),
    ProductsOptionsModel(
      Icons.delivery_dining_outlined,
      'Payment, delivery, return',
    ),
  ];
}