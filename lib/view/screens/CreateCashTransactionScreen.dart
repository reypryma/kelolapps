import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateCashTransaction extends StatefulWidget {
  const CreateCashTransaction({Key? key}) : super(key: key);

  @override
  _CreateCashTransactionState createState() => _CreateCashTransactionState();
}

class _CreateCashTransactionState extends State<CreateCashTransaction> {
  int chooseCashTransactionIndex = 0;
  TextEditingController _etAmountCash = TextEditingController();
  TextEditingController _etTitleCash = TextEditingController();

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
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_4),
            // height: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
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
                ),
                SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    decoration: boxDecorations(bgColor: KelolakuGlobalColor.light70, showShadow: true),
                    padding: EdgeInsets.only(top: 10, left: Dimensions.MARGIN_SIZE_GRID_4, right: Dimensions.MARGIN_SIZE_GRID_4),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Jumlah Uang', style: heading2.copyWith(color: KelolakuGlobalColor.dark40),),
                            8.width,
                            badgeLevel(title: AppString.mandatory)
                          ],
                        ),
                        TextField(
                          controller: _etAmountCash,
                          onSubmitted: (value) {
                            setState(() {
                              _etAmountCash.text = '';
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'masukkan nominal uang',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Dimensions.VERTICAL_SIZE_32.toInt().height,
                        Row(
                          children: [
                            Text('Judul Transaksi', style: heading2.copyWith(color: KelolakuGlobalColor.dark40),),
                            8.width,
                            badgeLevel(title: AppString.mandatory)
                          ],
                        ),
                        TextField(
                          controller: _etTitleCash,
                          onSubmitted: (value) {
                            setState(() {
                              _etTitleCash.text = '';
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Transaksi untuk Apa?',
                            isDense: true,
                          ),
                        ),
                        Dimensions.VERTICAL_SIZE_32.toInt().height,
                        Align(
                          alignment: Alignment.topLeft,
                            child: Text('Transaksi Untuk', style: heading2.copyWith(color: KelolakuGlobalColor.dark40))),
                        Dimensions.VERTICAL_SIZE_16.toInt().height,
                        TextFormField(
                          style: textRegular12.copyWith(
                              color: KelolakuGlobalColor.light60
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffix: Icon(
                              Icons.group_add_outlined,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: KelolakuGlobalColor.colorPrimaryExtra),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(width: 1, color: KelolakuGlobalColor.lightBorderInput),
                            ),
                            labelText: "Kepada Siapa Transaksi Dilakukan",
                            hintMaxLines: 2,
                            labelStyle: textRegular16.copyWith(
                                color: KelolakuGlobalColor.dark40
                            ),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                          // cursorColor: blackColor,
                          keyboardType: TextInputType.multiline,
                          validator: (s) {
                            if (s!.trim().isEmpty) return 'Masukkan Dekripsi Toko misal tentang usaha \n dan produk yang tersedia';
                            return null;
                          },
                        ),
                        Dimensions.VERTICAL_SIZE_32.toInt().height,
                      ],
                    )
                ),
                Dimensions.VERTICAL_SIZE_16.toInt().height,
                Container(
                    decoration: boxDecorations(bgColor: KelolakuGlobalColor.light70, showShadow: true),
                  padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_GRID_4, right: Dimensions.MARGIN_SIZE_GRID_4, top: Dimensions.VERTICAL_SIZE_16, bottom: Dimensions.VERTICAL_SIZE_16),
                  child:  TextFormField(
                    style: textRegular12.copyWith(
                        color: KelolakuGlobalColor.light60
                    ),
                    decoration: InputDecoration(
                      // floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(color: KelolakuGlobalColor.colorPrimaryExtra),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(width: 1, color: KelolakuGlobalColor.lightBorderInput),
                      ),
                      labelText: "Masukkan Dekripsi Tambahan",
                      hintMaxLines: 2,
                      labelStyle: textRegular16.copyWith(
                          color: KelolakuGlobalColor.dark40
                      ),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 5,
                    // cursorColor: blackColor,
                    keyboardType: TextInputType.multiline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.fromLTRB(Dimensions.MARGIN_SIZE_GRID_4, Dimensions.VERTICAL_SIZE_16, Dimensions.MARGIN_SIZE_GRID_4, Dimensions.BOTTOM_HEIGHT_GRID),
        child: AppButton(
          width: MediaQuery.of(context).size.width,
          height: 51,
          color: KelolakuGlobalColor.colorPrimaryLogo,
          //context.cardColor,
          text: "Buat Transaksi Sekarang",
          textColor: Colors.white,
          onTap: () {

          },
          shapeBorder:
          RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
          padding: const EdgeInsets.all(16),
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
            color: isSelected ? index == 0 ? KelolakuGlobalColor.green : KelolakuGlobalColor.orange : KelolakuGlobalColor.bgFeedAlt,
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
                            : index == 1 ? KelolakuGlobalColor.orange : KelolakuGlobalColor.dark40),
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
              // margin: EdgeInsets.only(right: 8, left: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                    ),
              child: const Icon(
                Icons.circle_outlined,
                color: KelolakuGlobalColor.dark60
                // size: 14,
              ),
            ),
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
