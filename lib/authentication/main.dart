import 'package:belajar_kuldii/authentication/pages/home_page.dart';
import 'package:belajar_kuldii/authentication/providers/auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './providers/products.dart';

import './pages/auth_page.dart';
import './pages/add_product_page.dart';
import './pages/edit_product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Authen(),
        ),
        ChangeNotifierProxyProvider<Authen, Products>(
          create: (context) => Products(),
          update: (context, auth, products) =>
              products!..updateData(auth.token, auth.userId),
        )
      ],
      builder: (context, child) => Consumer<Authen>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isAuthe
              ? HomePage()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return LoginScreen();
                  },
                ),
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            EditProductPage.route: (ctx) => EditProductPage(),
          },
        ),
      ),
    );
  }
}
