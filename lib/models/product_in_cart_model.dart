import 'package:task_2/models/products_model.dart';

class ProductInCartModel {
  final ProductModel product;
  int amount = 1;

  ProductInCartModel(
    this.product,
  );
}
