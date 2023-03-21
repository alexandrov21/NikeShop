import 'package:flutter/material.dart';
import 'package:task_2/mocks/products_mock.dart';
import 'package:task_2/models/products_model.dart';
import 'package:task_2/pages/product_detail_page/views/product_detail_options.dart';

import '../../models/product_in_cart_model.dart';
import '../../models/products_options_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/text_styles.dart';

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
  }

  void onSelectTab(int index) {
    Navigator.of(context).pushNamed('/third');
  }

  @override
  Widget build(BuildContext context) {
    final product =
        (ModalRoute.of(context)?.settings.arguments) as ProductsModel?;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            product?.name ?? '',
            style: TextStyles.productDetailPageNameText,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.favorite_border,
                color: AppColors.iconFavorite,
                size: 22,
              ),
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.share_outlined,
                size: 22,
              ),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        ],
      ),
      body: _buildBody(product!),
    );
  }

  Widget _buildBody(ProductsModel product) {
    return ListView(
      children: [
        Container(
          color: AppColors.containerColor,
          width: double.infinity,
          child: Column(
            children: [
              Image(
                image: AssetImage(product.photo),
                height: 360,
              ),
              _buildProductPriceAndBonuses(product),
              _buildDivider(),
              _buildProductSizes(product),
              _buildDivider(),
              _buildSelectingSize(),
              _buildDivider(),
              const SizedBox(
                height: 8,
              ),
              _buildAddingToCartButton(product),
              _buildBuyInOneClick(),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          color: AppColors.containerColor,
          width: double.infinity,
          child: const ProductDetailOptions(),
        ),
        const SizedBox(
          height: 12,
        ),
        _buildDescriptions(product),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 3,
      color: AppColors.dividerColor,
      indent: 20,
      endIndent: 20,
    );
  }

  Widget _buildSelectingSize() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.height,
            color: AppColors.iconSelectSize,
          ),
          Text(
            AppStrings.selectSize,
            style: TextStyles.selectSizeText,
          ),
        ],
      ),
    );
  }

  Widget _buildBuyInOneClick() {
    return Padding(
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
            AppStrings.buyInOneClick,
            style: TextStyles.buyInOneClickText,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptions(ProductsModel product) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPriceAndBonuses(ProductsModel product) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${product.price} \$',
            style: TextStyles.productDetailPagePriceText,
          ),
          Row(
            children: const [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.iconInfoBonuses,
                size: 24,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                AppStrings.bonuses,
                style: TextStyles.bonusesText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductSizes(ProductsModel product) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.sizes,
            style: TextStyles.productDetailPageSizesText,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.sizes,
            style: TextStyles.choosingSizesText,
          ),
        ],
      ),
    );
  }

  Widget _buildAddingToCartButton(ProductsModel product) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.addingToCartButton,
        border: Border(
          left: BorderSide(
            width: 16,
            color: AppColors.containerColor,
          ),
          right: BorderSide(
            width: 16,
            color: AppColors.containerColor,
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
              color: AppColors.iconAddToCart,
              size: 28,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              AppStrings.addToCart,
              style: TextStyles.addingToCartText,
            ),
          ],
        ),
      ),
    );
  }
}
