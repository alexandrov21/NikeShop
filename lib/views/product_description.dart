import 'package:flutter/material.dart';
import 'package:task_2/models/products_model.dart';

import '../models/products_options_model.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

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
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    final testParam =
        (ModalRoute.of(context)?.settings.arguments) as ProductsModel?;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            testParam?.description ?? '',
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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: ListView(
          children: [
            Image(
              image: AssetImage(testParam?.photo ?? ''),
              height: 360,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${testParam?.price} \$' ?? '',
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
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
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
                    testParam?.sizes ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      wordSpacing: 28,
                    ),
                  ),
                ],
              ),
            ),
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
            Container(
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
                onTap: () {},
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
            ),
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
            SizedBox(height: 8,),
            Column(
              children: ProductDescription.options.map((options) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            options.icon,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Text(
                              options.name,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right_sharp),
                        ],
                      ),
                      const Divider(
                        height: 3,
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_outline,
            ),
            label: 'Reviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_sharp,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
