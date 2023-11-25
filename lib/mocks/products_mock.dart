import '../models/product_in_cart_model.dart';
import '../models/products_model.dart';
import '../utils/image_path.dart';

abstract class ProductsMock {
  static List<ProductModel> products = [
    ProductModel(
      photo: ImagePath.product_1,
      name: 'Nike Tech Fleece Men',
      sizes: 'XS, S, M, L, XL',
      price: '130',
      description:
          'Comfortable jacket made of premium material. \n Perfectly combined with different types of clothes. \n Material: high-quality European 100% cotton. \n Season: year-round. \n Color: black.',
    ),
    // ProductsModel(
    //   ImagePath.product_2,
    //   'Nike Tech Fleece Women',
    //   'XS, S, M, L, XL',
    //   '120',
    //   'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    // ),
    // ProductsModel(
    //   ImagePath.product_3,
    //   'Nike Tech Fleece Joggers',
    //   'XS, S, M, L, XL',
    //   '120',
    //   'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    // ),
    ProductModel(
      photo: ImagePath.product_4,
      name: 'Nike Joggers',
      sizes: 'XS, S, M, L, XL',
      price: '80',
      description:
          'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductModel(
      photo: ImagePath.product_5,
      name: 'Nike Tech Fleece Hoodie',
      sizes: 'XS, S, M, L, XL',
      price: '100',
      description:
          'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
    ProductModel(
      photo: ImagePath.product_6,
      name: 'Nike Red Joggers',
      sizes: 'XS, S, M, L, XL',
      price: '88',
      description:
          'Comfortable jacket made of premium material. Perfectly combined with different types of clothes. Material: high-quality European 100% cotton. Season: year-round. Color: black.',
    ),
  ];

  static List<ProductInCartModel> saveProducts = [];
}
