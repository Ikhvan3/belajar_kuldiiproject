import 'package:belajar_kuldii/routes/gallery_page.dart';
import 'package:belajar_kuldii/routes/home_page.dart';
import 'package:belajar_kuldii/routes/photo_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppRoutes());
}

class AppRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: HomePage.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        GalleryPage.nameRoute: (context) => GalleryPage(),
        PhotoPage.nameRoute: (context) => PhotoPage(),
      },
    );
  }
}
