import 'package:flutter/material.dart';

class Product {
  @required
  String judul;
  @required
  String imageURL;
  @required
  String harga;
  @required
  String deskripsi;

  Product(this.judul, this.imageURL, this.harga, this.deskripsi);
}
