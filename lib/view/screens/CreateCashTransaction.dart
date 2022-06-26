import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/dimensions.dart';

class CreateCashTransaction extends StatefulWidget {
  const CreateCashTransaction({Key? key}) : super(key: key);

  @override
  _CreateCashTransactionState createState() => _CreateCashTransactionState();
}

class _CreateCashTransactionState extends State<CreateCashTransaction> {
  int chooseCashTransactionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: KelolakuGlobalColor.light70,
        title: Text("Catat Keuangan Baru",
            style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,
              color: KelolakuGlobalColor.dark, size: 20),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_4),
          // height: 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _getCashType(
                        index: 0,
                        title: "Kas Masuk",
                        address: "Untuk transaksi bersifat pemasukan"),
                  ),
                  SizedBox(width: 4,),
                  Expanded(
                    flex: 1,
                    child: _getCashType(
                        index: 1,
                        title: "Kas Keluar",
                        address: "Untuk transaksi bersifat pengeluaran"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCashType(
      {int? index, required String title, required String address}) {
    bool isSelected = index == chooseCashTransactionIndex;

    return InkWell(
      onTap: (){
        setState(() {
          chooseCashTransactionIndex = index!;
        });
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: isSelected ? index == 0 ? KelolakuGlobalColor.green : KelolakuGlobalColor.orange : KelolakuGlobalColor.dark30,
        ),
                // borderRadiusAll: 8,
        child: Row(
          children: [
            isSelected
                ? Container(
              alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0
                            ? KelolakuGlobalColor.green
                            : index == 1 ? KelolakuGlobalColor.orange : KelolakuGlobalColor.dark60),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: index == 0
                          ? KelolakuGlobalColor.light70 : index == 1 ? KelolakuGlobalColor.light70 :
                          Colors.transparent,
                      // size: 14,
                    ),
                  )
                : Container(
              alignment: Alignment.center,
                    // height: 26,
                    // width: 26,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 8, left: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: KelolakuGlobalColor.colorPrimaryExtra)),
                  ),
            // FxSpacing.width(isSelected ? 16 : 20),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: isSelected ? heading3.copyWith(color: KelolakuGlobalColor.light70)  : heading3.copyWith(color: KelolakuGlobalColor.dark60),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
