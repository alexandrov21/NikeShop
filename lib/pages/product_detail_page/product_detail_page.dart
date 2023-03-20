import 'package:flutter/material.dart';
import 'package:task_2/mocks/products_mock.dart';
import 'package:task_2/models/products_model.dart';
import 'package:task_2/pages/product_detail_page/views/product_detail_options.dart';

import '../../models/product_in_cart_model.dart';
import '../../models/products_options_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

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

  @override
  State<ProductDetailPage> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDetailPage> {
  void _addingToCart(ProductsModel? product) {
    int index = 0;
    bool hasProductInCart = false;
    for (int i = 0; i < ProductsMock.saveProducts.length; i++) {
      if (ProductsMock.saveProducts[i].product.name == product?.name) {
        hasProductInCart = true;
        index = i;
      }
    }
    if (hasProductInCart == true) {
      ProductsMock.saveProducts[index].amount++;
    } else {
      ProductsMock.saveProducts.add(
        ProductInCartModel(
          product ?? ProductsModel.empty(),
        ),
      );
    }
    //   for (int i = 0; i < ProductsMock.saveProducts.length; i++) {
    //     print('${ProductsMock.saveProducts[i].product.name} - ${ProductsMock
    //         .saveProducts[i].amount}');
    // }
    //   print('----------------------------------------');
  }

  void onSelectTab(int index) {
    Navigator.of(context).pushNamed('/third');
  }

  @override
  Widget build(BuildContext context) {
    final product =
        (ModalRoute.of(context)?.settings.arguments) as ProductsModel?;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            product?.name ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black54,
                  size: 22,
                ),
              ),
              IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Image(
                  image: AssetImage(product?.photo ?? ''),
                  height: 360,
                ),
                _buildProductPriceAndBonuses(product),
                const Divider(
                  height: 3,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                _buildProductSizes(product),
                const Divider(
                  height: 4,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.height,
                        color: Colors.black87,
                      ),
                      Text(
                        'Select the size',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 3,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildAddingToCartButton(product),
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.touch_app_outlined,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Buy in one click',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: const ProductDetailOptions(),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product?.description ?? ''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProductPriceAndBonuses(product){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${product?.price} \$',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.info_outline_rounded,
                color: Colors.black54,
                size: 24,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Bonuses:',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildProductSizes(product){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sizes:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product?.sizes ?? '',
            style: const TextStyle(
              fontSize: 20,
              wordSpacing: 28,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAddingToCartButton(product){
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFF2E7D32),
        border: Border(
          left: BorderSide(
            width: 16,
            color: Colors.white,
          ),
          right: BorderSide(
            width: 16,
            color: Colors.white,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => _addingToCart(product),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
