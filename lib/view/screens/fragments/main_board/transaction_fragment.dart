import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class TransactionFragment extends StatefulWidget {
  const TransactionFragment({Key? key}) : super(key: key);

  @override
  State<TransactionFragment> createState() => _TransactionFragmentState();
}

class _TransactionFragmentState extends State<TransactionFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Transaksi Minggu ini",
          color: KelolakuGlobalColor.colorPrimaryLogo,
          textColor: KelolakuGlobalColor.light70),
      body: SafeArea(
        child: Container(
          width: context.width(),
          height: MediaQuery.of(context).size.height * 0.22044334975,
          color: KelolakuGlobalColor.colorPrimaryLogo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              //   child: Text("db6_your_location", style: primaryTextStyle(color: KelolakuGlobalColor.light70)),
              // ),
               Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Text('Pengeluaran',
                              style: title14.copyWith(color: KelolakuGlobalColor.light70),),
                          SizedBox(height: 4,),
                          Text('Rp 6.000.000',
                              style: title20.copyWith(color: KelolakuGlobalColor.light70),),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: KelolakuGlobalColor.light70.withOpacity(0.9),
                      ),
                      Column(
                        children: [
                          Text('Pendapatan',
                            style: title14.copyWith(color: KelolakuGlobalColor.light70),),
                          SizedBox(height: 4,),
                          Text('Rp 6.000.000.000',
                            style: title20.copyWith(color: KelolakuGlobalColor.light70),),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05418719211,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: white),
                    alignment: Alignment.center,
                    child: const TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          fillColor: KelolakuGlobalColor.lightSmoke,
                          hintText: "Cari Pesanan",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.only(
                              left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                        )),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
