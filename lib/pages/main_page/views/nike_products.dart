import 'package:flutter/material.dart';
import 'package:task_2/services/firebase_products_service.dart';
import '../../../models/products_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class NikeProducts extends StatefulWidget {
  const NikeProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<NikeProducts> createState() => _NikeProductsState();
}

class _NikeProductsState extends State<NikeProducts> {
  final _firebaseProductsService = FirebaseProductsService();

  Future<List<ProductModel>> _getAllProducts() async {
    return await _firebaseProductsService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getAllProducts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return _buildProducts(snapshot.data ?? []);

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget _buildProducts(List<ProductModel> products) {
    return Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Wrap(
          children: products.map(
            (product) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    color: product.isSelect ? Colors.black87 : Colors.white,
                    child: InkWell(
                      onTap: () {
                        final isSelect = Navigator.of(context).pushNamed(
                          '/detail',
                          arguments: product,
                        );
                      },
                      child: _buildTileProduct(product),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ));
  }

  Widget _buildTileProduct(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTileImage(product),
        const SizedBox(
          height: 8,
        ),
        Text(
          product.name,
          style: TextStyles.productNameText,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          product.sizes,
          style: TextStyles.sizesText,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${product.price} \$',
          style: TextStyles.priceText,
        ),
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
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.containerLabel,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: AppColors.iconFavorite,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
