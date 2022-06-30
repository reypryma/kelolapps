import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';

class StoreCampaignScreen extends StatefulWidget {
  const StoreCampaignScreen({Key? key}) : super(key: key);

  @override
  _StoreCampaignScreenState createState() => _StoreCampaignScreenState();
}

class _StoreCampaignScreenState extends State<StoreCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: KelolakuGlobalColor.light70,
          automaticallyImplyLeading: false,
          title: Text("Promosikan Toko", style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: KelolakuGlobalColor.dark, size: 20),
          ),
        ),
        body: SafeArea(child: Container()));
  }
}
