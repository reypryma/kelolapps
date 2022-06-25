import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/ordermodel/OrderStatusCategory.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class TransactionFragment extends StatefulWidget {
  const TransactionFragment({Key? key}) : super(key: key);

  @override
  State<TransactionFragment> createState() => _TransactionFragmentState();
}

class _TransactionFragmentState extends State<TransactionFragment> {

  List<CPDataModel> tradeCrypto = getOrderStatusCategory();
  var tradIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Transaksi Minggu ini",
          color: KelolakuGlobalColor.colorPrimaryLogo,
          textColor: KelolakuGlobalColor.light70),
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // SizedBox(height: 8, width: 16),
                  Container(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tradeCrypto.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      itemBuilder: (context, index) {
                        CPDataModel data = tradeCrypto[index];
                        return InkWell(
                          onTap: () {
                            tradIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: tradIndex == index ? KelolakuGlobalColor.colorPrimaryLogo : Colors.grey.withOpacity(0.1),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              data.orderStatus!,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: tradIndex == index
                                    ? Colors.white
                                    : KelolakuGlobalColor.dark40,
                              ),
                            ),
                          ).onTap(
                                () {
                              tradIndex = index;
                              setState(() {});
                            },
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    color: KelolakuGlobalColor.light70,

                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              offset: Offset(0.1, 0.1),
              blurRadius: 0.2,
              spreadRadius: 0.2,
            ), //BoxShadow
            BoxShadow(
              color:Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        padding: const EdgeInsets.only(left: Dimensions.MARGIN_SIZE_GRID_8, right: Dimensions.MARGIN_SIZE_GRID_8, bottom: Dimensions.BOTTOM_HEIGHT_GRID, top: 8),
        child: Row(
          children: [
            Expanded(
              child: FxButton.outlined(
                borderColor: KelolakuGlobalColor.colorPrimaryExtra,
                borderRadiusAll: 4,
                onPressed: () {

                },
                child: Text(
                  "Catat Keuangan",
                  style: heading4.copyWith(color: KelolakuGlobalColor.colorPrimaryExtra),
                ),
              ),
            ),
            20.width,
            Expanded(
              child: FxButton.small(
                padding: FxSpacing.all(16),
                borderRadiusAll: 4,
                onPressed: () {

                },
                elevation: 0,
                child: Text(
                  "Buat Pesanan Baru",
                  style: heading4.copyWith(color: KelolakuGlobalColor.light70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
