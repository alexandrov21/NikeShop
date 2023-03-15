import 'package:flutter/material.dart';
import 'package:task_2/mocks/products_mock.dart';
import '../../utils/image_path.dart';
import '../../utils/text_styles.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalSum = 0;

  @override
  void initState() {
    super.initState();
    totalSum = _calculateTotalSum();
  }

  int _calculateTotalSum() {
    int totalSum = 0;
    for (int i = 0; i < ProductsMock.saveProducts.length; i++) {
      print('$i index');
      if (ProductsMock.saveProducts[i].amount > 1) {
        totalSum = totalSum +
            (int.parse(ProductsMock.saveProducts[i].product.price) *
                ProductsMock.saveProducts[i].amount);
        print('$totalSum');
      } else {
        totalSum =
            totalSum + int.parse(ProductsMock.saveProducts[i].product.price);
        print('$totalSum dcdcd');
      }
    }
    return totalSum;
  }

  void _resetCart() {
    print('$totalSum');
    setState(() {
      totalSum = 0;
      ProductsMock.saveProducts.clear();
    });
    print('$totalSum dvd');
  }

  // void offTakeItem(productAndAmount){
  //   if(productAndAmount) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 52),
            child: Image(
              image: AssetImage(ImagePath.userImage),
              height: 56,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Wrap(
                  children: ProductsMock.saveProducts.map(
                    (productsAndAmount) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          productsAndAmount.product.photo),
                                      height: 180,
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (productsAndAmount.amount > 1) {
                                              productsAndAmount.amount--;
                                              totalSum = totalSum -
                                                  int.parse(productsAndAmount
                                                      .product.price);
                                            } else {
                                              ProductsMock.saveProducts
                                                  .remove(productsAndAmount);
                                              totalSum = totalSum -
                                                  int.parse(productsAndAmount
                                                      .product.price);
                                            }
                                          });
                                          print('InlWell is working');
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black54,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  productsAndAmount.product.name,
                                  style: TextStyles.nameText,
                                ),
                                Text(
                                  '${productsAndAmount.amount.toString()} items',
                                  style: const TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                Text(
                                  '${int.parse(productsAndAmount.product.price) * productsAndAmount.amount} \$',
                                  style: TextStyles.priceText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 96,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  color: Colors.black12,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total Price : $totalSum \$',
                        style: TextStyles.totalPriceText,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        color: const Color(0xFF2E7D32),
                        width: 340,
                        child: InkWell(
                          onTap: () => _resetCart(),
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
                                'BUY ALL',
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
