import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<List<ProductModel>> getAllProductsInCart() async {
    final serverProducts = await firestore
        .collection(FirebaseApiConstants.firebaseProductsCart)
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

  Future<void> removeProductFromCart(ProductModel product) async {
    final productInServer = await firestore
        .collection(FirebaseApiConstants.firebaseProductsCart)
        .where(
          'productId',
          isEqualTo: product.productId,
        )
        .get();

    if (productInServer.docs.isNotEmpty) {
      await firestore
          .collection(FirebaseApiConstants.firebaseProductsCart)
          .doc(product.productId)
          .delete();
    }
  }

  Future<void> deleteCollection() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseApiConstants.firebaseProductsCart)
        .get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  }

  Future<void> addProductToCart(ProductModel product) async {
    final productInServer = await firestore
        .collection(FirebaseApiConstants.firebaseProductsCart)
        .where(
          'productId',
          isEqualTo: product.productId,
        )
        .get();
    if (productInServer.docs.isEmpty) {
      await firestore
          .collection(FirebaseApiConstants.firebaseProductsCart)
          .add(
            product.toJson(),
          )
          .then((product) async {
        await firestore
            .collection(FirebaseApiConstants.firebaseProductsCart)
            .doc(product.id)
            .set(
          {
            'productId': product.id,
          },
          SetOptions(merge: true),
        );
      });
    }
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
