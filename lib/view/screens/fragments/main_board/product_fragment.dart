import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';

class ProductFragment extends StatefulWidget {
  const ProductFragment({Key? key}) : super(key: key);

  @override
  _ProductFragmentState createState() => _ProductFragmentState();
}

class _ProductFragmentState extends State<ProductFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(      child: Text(
      'Produk Toko',
      style: heading1,
    ),);
  }
}
