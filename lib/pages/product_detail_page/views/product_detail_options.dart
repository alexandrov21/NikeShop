import 'package:flutter/material.dart';
import 'package:task_2/mocks/product_detail_mock.dart';

class ProductDetailOptions extends StatelessWidget {
  const ProductDetailOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ProductDetailMock.options.map((options) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    );
  }
}
