import 'package:flutter/material.dart';
import 'package:task_2/utils/image_path.dart';
import 'package:task_2/views/product_description.dart';

import '../models/products_model.dart';
import '../models/value_setter_model.dart';
import '../utils/text_styles.dart';

class NikeProducts extends StatefulWidget {
  final ValueSetter<ValueSetterModel> outputData;

  const NikeProducts({Key? key, required this.outputData}) : super(key: key);

  static List<ProductsModel> products = [
    ProductsModel(
      ImagePath.product_1,
      'Nike Tech Fleece Men',
      'XS, S, M, L, XL',
      '130',
    ),
    ProductsModel(
      ImagePath.product_2,
      'Nike Tech Fleece Women',
      'XS, S, M, L, XL',
      '120',
    ),
    ProductsModel(
      ImagePath.product_3,
      'Nike Tech Fleece Joggers',
      'XS, S, M, L, XL',
      '120',
    ),
    ProductsModel(
      ImagePath.product_4,
      'Nike Joggers',
      'XS, S, M, L, XL',
      '80',
    ),
    ProductsModel(
      ImagePath.product_5,
      'Nike Tech Fleece Hoodie',
      'XS, S, M, L, XL',
      '100',
    ),
    ProductsModel(
      ImagePath.product_6,
      'Nike Tech Fleece Joggers',
      'XS, S, M, L, XL',
      '88',
    ),
  ];

  @override
  State<NikeProducts> createState() => _NikeProductsState();
}

class _NikeProductsState extends State<NikeProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Wrap(
        children: NikeProducts.products.map(
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
                      if (product.color == Colors.white) {
                        product.color = Colors.grey.withOpacity(0.3);
                        widget.outputData(
                          ValueSetterModel(
                            true,
                            int.parse(product.price),
                          ),
                        );
                        Navigator.of(context).pushNamed(
                          '/second',
                          arguments: product,
                        );
                      } else {
                        product.color = Colors.white;
                        widget.outputData(
                          ValueSetterModel(
                            false,
                            int.parse(product.price),
                          ),
                        );
                      }
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
          product.description,
          style: TextStyles.descriptionText,
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
              color: Colors.white,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.black54,
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
