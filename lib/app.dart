import 'package:flutter/material.dart';
import 'package:task_2/pages/cart_page/cart_page.dart';
import 'package:task_2/pages/product_detail_page/product_detail_page.dart';
import 'pages/main_page/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
        ),
      ),
      routes: {
        '/main': (context) => const MainPage(),
        '/detail': (context, {arguments}) => const ProductDetailPage(),
        '/cart' : (context, {arguments}) => const CartPage(),
      },
      initialRoute: '/main',
      home: const MainPage(),
    );
  }
}
