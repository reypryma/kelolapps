import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

Widget createDefaultLabel(context, [String payStatus = "Belum Dibayar"]){
  return Container(
    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
    decoration: BoxDecoration(
        color: payStatus == "Belum Dibayar" ? KelolakuGlobalColor.orange40 : KelolakuGlobalColor.green,
        borderRadius: BorderRadius.circular(2)
    ),
    child: Row(
      children: [
        Text(payStatus, style: TextStyle(
            color: Colors.white, fontSize: 13
        )),
        SizedBox(
          width: 4,
        ),
        Icon(Icons.payments_outlined, color: Colors.white, size: 11)
      ],
    ),
  );
}

BoxDecoration boxDecorations({double radius = 8, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [BoxShadow(color: KelolakuGlobalColor.lightSmoke, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}