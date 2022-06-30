import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/digitalstore/dshop_color_style.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/data/model/productmodel/product_model.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class DigitalProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;

  DigitalProductDetailScreen({required this.productModel});

  @override
  State<DigitalProductDetailScreen> createState() =>
      _DigitalProductDetailScreenState();
}

class _DigitalProductDetailScreenState
    extends State<DigitalProductDetailScreen> {
  dynamic _productModel = Get.arguments;
  final List<String> _imgProductSlider = [
    (KelolaImage.imagePromoList[0]),
    (KelolaImage.imagePromoList[1]),
    (KelolaImage.imagePromoList[2]),
  ];
  int _currentImageSlider = 0;

  // size data
  List<String> _sizeList = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  int _sizeIndex = 0;

  // color data
  List<String> _colorList = [
    'Red',
    'Black',
    'Green',
    'White',
    'Blue',
    'Yellow',
    'Pink'
  ];
  int _colorIndex = 0;

  // wishlist
  bool _isLove = false;

  // shopping cart count
  int _shoppingCartCount = 3;

  @override
  void initState() {
    // image slider for the product
    // _imgProductSlider.add(_productModel.image);
    super.initState();
    init();
  }

  Future<void> init() async {
    if (kDebugMode) {
      print("$_productModel");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);

    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Column(
        children: [Flexible(child: _createProductSlider())],
      ),
    ));
  }

  Widget _customShoppingCart(int count) {
    return Stack(
      children: <Widget>[
        Icon(Icons.shopping_cart, color: KelolakuGlobalColor.dark),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: KelolakuGlobalColor.lightSmoke,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _createProductSlider() {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Stack(children: [
      CarouselSlider(
        items: _imgProductSlider
            .map((item) => Container(
                  child: commonCachedNetworkImage(item,
                      fit: BoxFit.fill, width: bannerWidth),
                ))
            .toList(),
        options: CarouselOptions(
            aspectRatio: 1,
            viewportFraction: 1.0,
            height: bannerHeight,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageSlider = index;
              });
            }),
      ),
      Positioned(
        bottom: 16,
        left: 16,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          decoration: BoxDecoration(
              color: DStoreGlobalColor.colorDigitalStore,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
              (_currentImageSlider + 1).toString() +
                  '/' +
                  _imgProductSlider.length.toString(),
              style: TextStyle(color: Colors.white, fontSize: 11)),
        ),
      ),
      Positioned(
          top: kToolbarHeight,
          left: 16,
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child:
                const Icon(Icons.arrow_back, color: KelolakuGlobalColor.dark),
          ).onTap(() {
            finish(context);
          }))
    ]);
  }
}
