import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/kasmodel/KasData.dart';
import 'package:kelolapps/data/model/kasmodel/kas_model.dart';
import 'package:kelolapps/data/model/ordermodel/OrderStatusCategory.dart';
import 'package:kelolapps/data/model/ordermodel/orders_model.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class TransactionFragment extends StatefulWidget {
  const TransactionFragment({Key? key}) : super(key: key);

  @override
  State<TransactionFragment> createState() => _TransactionFragmentState();
}

class _TransactionFragmentState extends State<TransactionFragment> {
  List<CPDataModel> orderStatusCategory = getOrderStatusCategory();
  var orderStatusCategoryIndex = 0;
  List<OrderModel> orderList = getCustomerOrders();
  List<TransactionModel> transactionList = getTransactionList();

  @override
  Widget build(BuildContext context) {
    double heightReserved =
        MediaQuery.of(context).size.height * 0.22044334975 + 105;
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Pengeluaran',
                              style: title14.copyWith(
                                  color: KelolakuGlobalColor.light70),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Rp 6.000.000',
                              style: title20.copyWith(
                                  color: KelolakuGlobalColor.light70),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: KelolakuGlobalColor.light70.withOpacity(0.9),
                        ),
                        Column(
                          children: [
                            Text(
                              'Pendapatan',
                              style: title14.copyWith(
                                  color: KelolakuGlobalColor.light70),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Rp 6.000.000.000',
                              style: title20.copyWith(
                                  color: KelolakuGlobalColor.light70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height:
                          MediaQuery.of(context).size.height * 0.05418719211,
                      decoration: const BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
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
                      itemCount: orderStatusCategory.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      itemBuilder: (context, index) {
                        CPDataModel data = orderStatusCategory[index];
                        return InkWell(
                          onTap: () {
                            orderStatusCategoryIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: orderStatusCategoryIndex == index
                                  ? KelolakuGlobalColor.colorPrimaryLogo
                                  : Colors.grey.withOpacity(0.1),
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
                                color: orderStatusCategoryIndex == index
                                    ? Colors.white
                                    : KelolakuGlobalColor.dark40,
                              ),
                            ),
                          ).onTap(
                            () {
                              orderStatusCategoryIndex = index;
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
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    // fit: FlexFit.loose,
                    height: MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        MediaQuery.of(context).padding.top -
                        kBottomNavigationBarHeight -
                        heightReserved,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: KelolakuGlobalColor.light70),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orderStatusCategoryIndex == 0
                          ? orderList.length
                          : orderStatusCategoryIndex == 1
                              ? orderList.length
                              : orderStatusCategoryIndex == 2
                                  ? orderList.length
                                  : orderStatusCategoryIndex == 3
                                      ? orderList.length
                                      : orderStatusCategoryIndex == 4
                                          ? transactionList.length
                                          : transactionList.length,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      itemBuilder: (BuildContext context, int index) {
                        return orderStatusCategoryIndex != 4
                            ? _buildOrderCard(
                                index, orderList[index].paymentStatus!)
                            : _buildMyCashFlowCard(index);
                      },
                    ),
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
              offset: const Offset(0.1, 0.1),
              blurRadius: 0.2,
              spreadRadius: 0.2,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        padding: const EdgeInsets.only(
            left: Dimensions.MARGIN_SIZE_GRID_8,
            right: Dimensions.MARGIN_SIZE_GRID_8,
            bottom: Dimensions.BOTTOM_HEIGHT_GRID,
            top: 8),
        child: Row(
          children: [
            Expanded(
              child: FxButton.outlined(
                borderColor: KelolakuGlobalColor.colorPrimaryExtra,
                borderRadiusAll: 4,
                onPressed: () {
                  Get.toNamed(RouteHelper.getCreateTransactionRoute());
                },
                child: Text(
                  "Catat Keuangan",
                  style: heading4.copyWith(
                      color: KelolakuGlobalColor.colorPrimaryExtra),
                ),
              ),
            ),
            20.width,
            Expanded(
              child: FxButton.small(
                padding: FxSpacing.all(16),
                borderRadiusAll: 4,
                onPressed: () {},
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

  Widget _buildOrderCard(int? index, String paystatus) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if default address == true, add default label
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pesanan ${orderList[index!].id}",
                      style:
                          heading2.copyWith(color: KelolakuGlobalColor.dark)),
                  createDefaultLabel(context, orderList[index].orderStatus!)
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(orderList[index].customer.fName!,
                    style: textRegular16.copyWith(
                        color: KelolakuGlobalColor.dark40)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(orderList[index].customer.phone!,
                    style: textRegular16.copyWith(
                        color: KelolakuGlobalColor.dark40)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text('12 Januari 2022 | 04:57',
                    style: textRegular16.copyWith(
                        color: KelolakuGlobalColor.dark40)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("Rp ${orderList[index].orderAmount!}",
                    style: title16.copyWith(
                        color: KelolakuGlobalColor.colorPrimaryExtra)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyCashFlowCard(int? index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if default address == true, add default label
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${transactionList[index!].title}",
                        style:
                            heading3.copyWith(color: KelolakuGlobalColor.dark),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: Dimensions.VERTICAL_SIZE_4,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                              '${transactionList[index].type.name} ${transactionList[index].transactionAmount}',
                              style: textRegular16.copyWith(
                                  color: KelolakuGlobalColor.dark40))),
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      // margin: EdgeInsets.only(top: 15),
                      decoration: boxDecorations(
                          bgColor: KelolakuGlobalColor.colorPrimaryExtra,
                          radius: 4),
                      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                      child: Center(
                        child: Text(AppString.update,
                            style: title16.copyWith(
                                color: KelolakuGlobalColor.light70)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
