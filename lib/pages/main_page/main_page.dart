import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_2/services/firebase_products_service.dart';
import 'package:task_2/utils/image_path.dart';
import 'package:task_2/pages/main_page/views/nike_products.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final firebaseProductsService = FirebaseProductsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Image(
              image: AssetImage(ImagePath.userImage),
              height: 56,
            ),
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 16,
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/cart',
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.iconCart,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildFiltersAndSorting(),
          const SizedBox(height: 12),
          const NikeProducts(),
        ],
      ),
    );
  }

  Widget _buildFiltersAndSorting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 48,
            top: 20,
          ),
          child: Row(
            children: const [
              Icon(Icons.list_outlined),
              SizedBox(width: 8),
              Text(
                AppStrings.filters,
                style: TextStyles.mainPageFiltersText,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 48,
            top: 20,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.signal_cellular_alt_outlined,
              ),
              SizedBox(width: 8),
              Text(
                AppStrings.sorting,
                style: TextStyles.mainPageSortingText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
