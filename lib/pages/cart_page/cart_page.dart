import 'package:flutter/material.dart';
import 'package:task_2/mocks/products_mock.dart';
import 'package:task_2/models/product_in_cart_model.dart';
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
  int totalSum = 0;

  @override
  void initState() {
    super.initState();
    totalSum = _calculateTotalSum();
  }

  int _calculateTotalSum() {
    int totalSum = 0;
    for (int i = 0; i < ProductsMock.saveProducts.length; i++) {
      if (ProductsMock.saveProducts[i].amount > 1) {
        totalSum = totalSum +
            (int.parse(ProductsMock.saveProducts[i].product.price) *
                ProductsMock.saveProducts[i].amount);
      } else {
        totalSum =
            totalSum + int.parse(ProductsMock.saveProducts[i].product.price);
      }
    }
    return totalSum;
  }

  void _resetCart() {
    setState(() {
      totalSum = 0;
      ProductsMock.saveProducts.clear();
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
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
        _buildTotalPriceBar(),
      ],
    );
  }

  Widget _buildTileImage(ProductInCartModel productsAndAmount) {
    return Stack(
      children: [
        Image(
          image: AssetImage(productsAndAmount.product.photo),
          height: 180,
        ),
        Positioned(
          top: 8,
          right: 8,
          child: _buildRemoveButton(productsAndAmount),
        ),
      ],
    );
  }

  Widget _buildRemoveButton(ProductInCartModel productsAndAmount) {
    return InkWell(
      onTap: () {
        setState(
          () {
            if (productsAndAmount.amount > 1) {
              productsAndAmount.amount--;
              totalSum = totalSum - int.parse(productsAndAmount.product.price);
            } else {
              ProductsMock.saveProducts.remove(productsAndAmount);
              totalSum = totalSum - int.parse(productsAndAmount.product.price);
            }
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.containerColor,
        ),
        child: const Icon(
          Icons.remove,
          color: AppColors.iconRemove,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildTileProduct(ProductInCartModel productsAndAmount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTileImage(productsAndAmount),
        Text(
          productsAndAmount.product.name,
          style: TextStyles.nameText,
        ),
        Text(
          '${productsAndAmount.amount.toString()} items',
          style: TextStyles.amountItemsText,
        ),
        Text(
          '${int.parse(productsAndAmount.product.price) * productsAndAmount.amount} \$',
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
        onTap: () => _resetCart(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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

  Widget _buildTotalPriceBar() {
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
                  'Total Price : $totalSum \$',
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
