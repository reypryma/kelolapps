import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/digitalstore/dshop_color_style.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/productmodel/CategoryData.dart';
import 'package:kelolapps/data/model/productmodel/ProductData.dart';
import 'package:kelolapps/data/model/productmodel/category_model.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/utils/status_bar.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalProductDetailScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class DigitalStoreHomeScreen extends StatefulWidget {
  const DigitalStoreHomeScreen({Key? key}) : super(key: key);

  @override
  State<DigitalStoreHomeScreen> createState() => _DigitalStoreHomeScreenState();
}

class _DigitalStoreHomeScreenState extends State<DigitalStoreHomeScreen> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  late var isOpen;
  late var shopOpen;
  List<ProductCategoryModel> categoryList = getCategoryList();
  List<bool> _selectedCategory = getInitialSelectedCategoryCount();
  var recomendedProductData = getProductList();

  @override
  Widget build(BuildContext context) {
    var sliverheight = 0.1539408867 * context.height();

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: sliverheight + 50,
                floating: true,
                snap: false,
                backgroundColor: Colors.white,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                automaticallyImplyLeading: false,
                elevation: innerBoxIsScrolled ? 0.5 : 0,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Stack(
                      children: [
                        FittedBox(
                            child: commonCachedNetworkImage(
                                KelolaImage.bannerStore,
                                height: sliverheight,
                                width: context.width(),
                                fit: BoxFit.fill,
                                radius: 0)),
                        // .cornerRadiusWithClipRRect(16)
                        Container(
                          height: sliverheight + 50,
                          width: context.width(),
                          padding: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_GRID_8,
                              right: Dimensions.MARGIN_SIZE_GRID_8,
                              top: Dimensions.VERTICAL_SIZE_16),
                          decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(0),
                              gradient: LinearGradient(colors: [
                                KelolakuGlobalColor.dark60.withOpacity(0.4),
                                KelolakuGlobalColor.dark60.withOpacity(0.5)
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppString.storeName,
                                    style: large28.copyWith(
                                        color: KelolakuGlobalColor.light70),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 6, bottom: 6),
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: isOpen
                                                  ? KelolakuGlobalColor.green
                                                      .withOpacity(.7)
                                                  : KelolakuGlobalColor.dark40,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                      child: Text(
                                          "Toko ${AppString.open}"
                                              .toUpperCase(),
                                          style: textRegular14.copyWith(
                                              color: white)),
                                    ),
                                  ),
                                  16.width,
                                  AppButton(
                                    color: KelolakuGlobalColor.light60,
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 6, bottom: 6),
                                    onTap: () {
                                      //
                                    },
                                    elevation: 0,
                                    shapeBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.library_books_rounded,
                                            color: KelolakuGlobalColor.dark70),
                                        4.width,
                                        Text("Informasi Toko",
                                            style: textSemibold14.copyWith(
                                                color: KelolakuGlobalColor
                                                    .dark70)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              16.height
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Container(
                    height: kToolbarHeight,
                    decoration: BoxDecoration(
                      color: KelolakuGlobalColor.light70,
                      boxShadow: [
                        BoxShadow(
                            color: KelolakuGlobalColor.grayFed.withOpacity(0.3),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2.0)
                      ],
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      itemBuilder: (BuildContext context, int index) {
                        ProductCategoryModel data = categoryList[index];
                        return Container(
                          margin: const EdgeInsets.all(4),
                          child: FilterChip(
                            onSelected: (bool value) {
                              setState(() {
                                _selectedCategory[index] =
                                    !_selectedCategory[index];
                              });
                            },
                            selected: _selectedCategory[index],
                            checkmarkColor: _selectedCategory[index]
                                ? KelolakuGlobalColor.light60
                                : KelolakuGlobalColor.dark,
                            selectedColor: DStoreGlobalColor.colorDigitalStore,
                            padding: const EdgeInsets.all(4),
                            label: Text(
                              categoryList[index].name,
                              style: textSemibold14.copyWith(
                                  color: _selectedCategory[index]
                                      ? KelolakuGlobalColor.light60
                                      : KelolakuGlobalColor.dark),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            width: context.width(),
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _searchProduct(),
                    // SizedBox(
                    //   height: Dimensions.VERTICAL_SIZE_16,
                    // ),
                    createCoupon(context, RouteHelper.getViewDigitalStorePromo,
                        bgColor: DStoreGlobalColor.colorDigitalStore),
                    CustomScrollView(
                        shrinkWrap: true,
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                            sliver: SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: GlobalStyle.gridDelegateRatio,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return _buildRecomendedProductCard(index);
                                },
                                childCount: recomendedProductData.length,
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationRoundedWithShadow(
          8,
          backgroundColor: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,
                color: DStoreGlobalColor.colorDigitalStore),
            Text(
              "Anda memiliki Keranjang ",
              style:
                  primaryTextStyle(color: KelolakuGlobalColor.dark, size: 18),
              textAlign: TextAlign.center,
            ).expand(),
            Badge(
              elevation: 0,
              padding: EdgeInsetsDirectional.only(end: 4),
              badgeColor: KelolakuGlobalColor.dark40,
              // badgeContent: Icon(Icons.error, size: 16.0, color: Colors.red),
              child: Row(
                children: [
                  Text(
                    "Buka",
                    style: heading3.copyWith(
                        color: DStoreGlobalColor.colorDigitalStore),
                  ),
                  4.width,
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: DStoreGlobalColor.colorDigitalStore,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    osSetStatusBarColor(
        statusBarColor: DStoreGlobalColor.colorDigitalStore.withOpacity(0.7));
    isOpen = true;
    shopOpen = "Toko Libur";
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  Widget _searchProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
          padding: EdgeInsets.symmetric(vertical: 16),
          child: TextFormField(
            autocorrect: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              hintText: 'Cari Produk dari Toko',
              prefixIcon: Icon(Icons.search, color: KelolakuGlobalColor.dark40),
              hintStyle: TextStyle(color: KelolakuGlobalColor.dark40),
              filled: true,
              fillColor: context.cardColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: KelolakuGlobalColor.dark, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(color: DStoreGlobalColor.colorDigitalStore, width: 0.5),
              ),
            ),
          ),
        ).expand(),
        // 8.width,
        // Container(
        //   padding: EdgeInsets.all(8),
        //   margin: EdgeInsets.only(right: 14),
        //   height: 45,
        //   child: Icon(Icons.filter_list, color: Colors.grey),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     border: Border.all(color: KelolakuGlobalColor.grayFed, width: 0.5),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildRecomendedProductCard(index) {
    final double boxImageSize =
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Get.toNamed(RouteHelper.getProductDetailsRoute,
              arguments: DigitalProductDetailScreen(productModel: recomendedProductData[index]),
            );
          },
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: buildCacheNetworkImage(
                          width: boxImageSize,
                          height: boxImageSize,
                          url: recomendedProductData[index].image)),
                  Positioned(
                      right: 16,
                      top: 16,
                      child: Icon(
                        Icons.favorite_border,
                        color: white,
                        size: 22,
                      ).onTap(() {})),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recomendedProductData[index].name,
                      style: title20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp ${recomendedProductData[index].price.toString().formatRupiah()}',
                            style: heading1.copyWith(
                                color: DStoreGlobalColor.colorDigitalStore),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
