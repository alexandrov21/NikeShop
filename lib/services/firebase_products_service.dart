import 'package:task_2/api/firebase_api_constants.dart';
import 'package:task_2/mocks/products_mock.dart';
import 'package:task_2/models/products_model.dart';

import '../mixins/firebase_mixin.dart';

class FirebaseProductsService with FirebaseInstanceMixin {
  FirebaseProductsService();

  Future<List<ProductModel>> getAllProducts() async {
    final serverProducts = await firestore
        .collection(FirebaseApiConstants.firebaseProductsCollection)
        .get();
    List<ProductModel> products = [];
    final productsMap = serverProducts.docs;
    for (int i = 0; i < productsMap.length; i++) {
      final id = productsMap[i].id;
      final product = productsMap[i].data();

      products.add(ProductModel.fromJson(product).copyWith(
        productId: id,
      ));
    }

    return products;
  }

  // Use only one time !!!
  Future<void> addProductToDataBase() async {
    final products = ProductsMock.products;

    for (var product in products) {
      await firestore
          .collection(FirebaseApiConstants.firebaseProductsCollection)
          .add(
            product.toJson(),
          );
    }
  }
}
