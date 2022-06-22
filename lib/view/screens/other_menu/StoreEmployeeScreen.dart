import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/view/screens/sheets/employee_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreEmployeeScreen extends StatefulWidget {
  const StoreEmployeeScreen({Key? key}) : super(key: key);

  @override
  _StoreEmployeeScreenState createState() => _StoreEmployeeScreenState();
}

class _StoreEmployeeScreenState extends State<StoreEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text("Pengurus Toko", style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: KelolakuGlobalColor.dark, size: 20),
          ),
          actions: [
            TextIcon(
              text: "Menu",
              textStyle: textSemibold14.copyWith(color: KelolakuGlobalColor.ocean60),
              suffix: const Icon(Icons.keyboard_arrow_down, color: KelolakuGlobalColor.ocean60),
              onTap: (){
                showEmployeeOptionSheet(context);
              }
            )
          ],
        ),
        body: SafeArea(child: Container()));
  }
}
