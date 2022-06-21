import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';

class TransactionFragment extends StatefulWidget {
  const TransactionFragment({Key? key}) : super(key: key);

  @override
  State<TransactionFragment> createState() => _TransactionFragmentState();
}

class _TransactionFragmentState extends State<TransactionFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Transaksi',
        style: heading1,
      ),
    );
  }
}
