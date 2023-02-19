import 'package:flutter/material.dart';
import 'package:task_2/views/product_description.dart';

import 'main_page/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
        ),
      ),
      routes: {
        '/main': (context) => MainPage(),
        '/second': (context, {arguments}) => ProductDescription(),
      },
      initialRoute: '/main',
      home: MainPage(),
    );
  }
}
