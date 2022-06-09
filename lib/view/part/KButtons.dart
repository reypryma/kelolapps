import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

FlatButton froyoFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: KelolakuGlobalColor.light,
    color: KelolakuGlobalColor.colorPrimaryExtra,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double? radius;

  const StyledFlatButton(this.text, {this.onPressed, Key? key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: const Color(0xfffada36),
      splashColor: const Color(0xfffada36),
      onPressed: () {
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
        side: const BorderSide(
          color: Color(0xfffada36),
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 50),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white, height: 1, fontWeight: FontWeight.w500,),
        ),
      ),
    );
  }
}