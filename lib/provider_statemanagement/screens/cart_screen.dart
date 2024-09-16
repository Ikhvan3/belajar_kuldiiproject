import 'package:belajar_kuldii/provider_statemanagement/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total : \$${cardData.totalHarga}",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${cardData.items.values.toList()[index].title}"),
                  subtitle:
                      Text("${cardData.items.values.toList()[index].qty}"),
                  trailing: Text(
                      "\$ ${cardData.items.values.toList()[index].price * cardData.items.values.toList()[index].qty}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
