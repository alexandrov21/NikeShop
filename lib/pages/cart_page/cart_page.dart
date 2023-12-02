import 'package:flutter/material.dart';
import 'package:task_2/mocks/products_mock.dart';
import 'package:task_2/models/products_model.dart';
import 'package:task_2/services/firebase_products_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/image_path.dart';
import '../../utils/text_styles.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _firebaseProductsService = FirebaseProductsService();
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<List<ProductModel>> _getAllProductsInCart() async {
    return await _firebaseProductsService.getAllProductsInCart();
  }

  int _calculateTotalSum(List<ProductModel> products) {
    int totalSum = 0;
    for (var product in products) {
      totalSum += int.tryParse(product.price) ?? 0;
    }

    return totalSum;
  }

  Future<void> _resetCart() async {
    await _firebaseProductsService.deleteCollection();
    setState(() {
      totalPrice = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.iconBack,
        ),
        backgroundColor: AppColors.appBarBackground,
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
      body: FutureBuilder<List<ProductModel>>(
        future: _getAllProductsInCart(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return _buildBody(snapshot.data ?? []);

            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  Widget _buildBody(List<ProductModel> products) {
    return Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Wrap(
                children: products.map(
                  (productsAndAmount) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: _buildTileProduct(productsAndAmount),
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
        _buildTotalPriceBar(products),
      ],
    );
  }

  Widget _buildTileImage(ProductModel product) {
    return Stack(
      children: [
        Image(
          image: AssetImage(product.photo),
          height: 180,
        ),
        Positioned(
          top: 8,
          right: 8,
          child: _buildRemoveButton(product),
        ),
      ],
    );
  }

  Widget _buildRemoveButton(ProductModel product) {
    return InkWell(
      onTap: () async {
        await _firebaseProductsService.removeProductFromCart(product);
        setState(() {});

        // setState(
        //   () {
        //     if (productsAndAmount.amount > 1) {
        //       productsAndAmount.amount--;
        //       totalPrice -= int.parse(productsAndAmount.product.price);
        //     } else {
        //       ProductsMock.saveProducts.remove(productsAndAmount);
        //       totalPrice -= int.parse(productsAndAmount.product.price);
        //     }
        //   },
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.containerLabel,
        ),
        child: const Icon(
          Icons.remove,
          color: AppColors.iconRemove,
          size: 16,
        ),
      ),
    );
  }

  // TODO : refactor with amount
  Widget _buildTileProduct(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTileImage(product),
        Text(
          product.name,
          style: TextStyles.productNameText,
        ),
        const Text(
          '1 items',
          style: TextStyles.amountItemsText,
        ),
        Text(
          '${int.parse(product.price) * 1} \$',
          style: TextStyles.priceText,
        ),
      ],
    );
  }

  Widget _buildButtonBuy() {
    return Container(
      height: 40,
      color: AppColors.buyAllButton,
      width: 340,
      child: InkWell(
        onTap: () async => await _resetCart(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.iconBuyAll,
              size: 28,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              AppStrings.buyAll,
              style: TextStyles.buyAllText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPriceBar(List<ProductModel> products) {
    totalPrice = _calculateTotalSum(products);
    return Positioned(
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
            color: AppColors.containerBuyAll,
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
                  'Total Price : $totalPrice \$',
                  style: TextStyles.totalPriceText,
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildButtonBuy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
