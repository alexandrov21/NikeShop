import 'package:flutter/material.dart';
import '../../../mocks/products_mock.dart';
import '../../../models/products_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class NikeProducts extends StatefulWidget {

  const NikeProducts({Key? key,}) : super(key: key);

  @override
  State<NikeProducts> createState() => _NikeProductsState();
}

class _NikeProductsState extends State<NikeProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Wrap(
        children: ProductsMock.products.map(
          (product) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 4,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  color: product.color,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/second',
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
      ),
    );
  }

  Widget _buildTileProduct(ProductsModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTileImage(product),
        const SizedBox(
          height: 8,
        ),
        Text(
          product.name,
          style: TextStyles.nameText,
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

  Widget _buildTileImage(ProductsModel product) {
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
              color: AppColors.containerColor,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: AppColors.iconFavorite,
              size: 16,
            ),
          ),
        ),
        Container(
          height: 180,
          width: 180,
          color: product.color == Colors.grey.withOpacity(0.3)
              ? Colors.grey.withOpacity(0.5)
              : null,
        ),
      ],
    );
  }
}
