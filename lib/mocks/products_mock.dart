import '../models/product_in_cart_model.dart';
import '../models/products_model.dart';
import '../utils/image_path.dart';

abstract class ProductsMock{
  static List<ProductsModel> products = [
    ProductsModel(
      ImagePath.product_1,
      'Nike Tech Fleece Men',
      'XS, S, M, L, XL',
      '130',
      'Comfortable jacket made of premium material. \n Perfectly combined with different types of clothes. \n Material: high-quality European 100% cotton. \n Season: year-round. \n Color: black.',
    ),
    ProductsModel(
      ImagePath.product_2,
      'Nike Tech Fleece Women',
      'XS, S, M, L, XL',
      '120',
      'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductsModel(
      ImagePath.product_3,
      'Nike Tech Fleece Joggers',
      'XS, S, M, L, XL',
      '120',
      'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductsModel(
      ImagePath.product_4,
      'Nike Joggers',
      'XS, S, M, L, XL',
      '80',
      'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductsModel(
      ImagePath.product_5,
      'Nike Tech Fleece Hoodie',
      'XS, S, M, L, XL',
      '100',
      'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductsModel(
      ImagePath.product_6,
      'Nike Red Joggers',
      'XS, S, M, L, XL',
      '88',
      'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
  ];

  static List<ProductInCartModel> saveProducts = [];
}