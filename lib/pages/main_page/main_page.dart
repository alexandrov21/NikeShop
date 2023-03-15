import 'package:flutter/material.dart';
import 'package:task_2/models/value_setter_model.dart';
import 'package:task_2/utils/image_path.dart';
import 'package:task_2/pages/main_page/views/nike_products.dart';
import '../../mocks/products_mock.dart';
import '../../utils/text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 0;
  int totalSum = 0;

  void checkForOperationAndValue(ValueSetterModel params) {
    setState(() {
      if (params.isIncrement == true) {
        count++;
        totalSum = totalSum + params.price;
      } else {
        count = count - 1;
        totalSum = totalSum - params.price;
      }
    });
  }



  // void _resetValue() {
  //   setState(() {
  //     for (var i = 0; i < ProductsMock.products.length; i++) {
  //       ProductsMock.products[i].color = Colors.white;
  //     }
  //     count = 0;
  //     totalSum = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 52),
            child: Image(
              image: AssetImage(ImagePath.userImage),
              height: 56,
            ),
          ),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Items: $count',
                style: TextStyles.itemCounterText,
              ),
              Text(
                'Total Price: $totalSum \$',
                style: TextStyles.totalPriceCounterText,
              ),
            ],
          ),
          IconButton(
            splashRadius: 16,
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/third',
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildFiltersAndSorting(),
          const SizedBox(height: 12),
          NikeProducts(
            outputData: (params) => checkForOperationAndValue(params),
          ),
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
                'FILTERS',
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
                'SORTING',
                style: TextStyles.mainPageSortingText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
