import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/view/screens/fragments/main_board/home_fragment.dart';
import 'package:kelolapps/view/screens/fragments/main_board/product_fragment.dart';

import 'fragments/main_board/other_menu_fragment.dart';
import 'fragments/main_board/transaction_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final _pages = <Widget>[
    const HomeFragment(),
    const TransactionFragment(),
    const ProductFragment(),
    const OtherMenuFragment(),
  ];


  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: KelolakuGlobalColor.light70,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(color: KelolakuGlobalColor.colorPrimaryExtra),
      selectedItemColor: KelolakuGlobalColor.colorPrimaryExtra,
      unselectedLabelStyle: const TextStyle(color: KelolakuGlobalColor.dark30),
      unselectedItemColor: KelolakuGlobalColor.dark30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transaksi'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Produk'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Fitur Lain'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
          Get.toNamed(RouteHelper.getStoreOrderListRoute());
      }  else{
        _selectedIndex = index;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _bottomTab(),
      body: Center(child: _pages.elementAt(_selectedIndex)),
    ));
  }
}
