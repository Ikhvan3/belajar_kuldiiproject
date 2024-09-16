import 'dart:math';

import 'package:belajar_kuldii/modelapp/models/product.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePageModelApp extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
          faker.food.restaurant(),
          "https://picsum.photos/id/$index/200",
          " Rp ${10000 + Random().nextInt(100000)}",
          faker.lorem.sentence());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Marketplace"),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageURL),
            footer: Container(
              height: 80,
              alignment: Alignment.center,
              color: Colors.green.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dummyData[index].judul,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyData[index].harga,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    dummyData[index].deskripsi,
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
