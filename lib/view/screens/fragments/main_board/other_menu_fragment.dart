import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';

class OtherMenuFragment extends StatefulWidget {
  const OtherMenuFragment({Key? key}) : super(key: key);

  @override
  _OtherMenuFragmentState createState() => _OtherMenuFragmentState();
}

class _OtherMenuFragmentState extends State<OtherMenuFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Menu Lain',
        style: heading1,
      ),
    );
  }
}
