import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kelolapps/data/model/ordermodel/PaymentStatus.dart';

import 'orders_model.dart';

List<CPDataModel> getOrderStatusCategory() {
  List<CPDataModel> orderStatusCategory = [];
  orderStatusCategory.add(CPDataModel(orderStatus: "Diterima"));
  orderStatusCategory.add(CPDataModel(orderStatus:"Dikirim"));
  orderStatusCategory.add(CPDataModel(orderStatus:"Dikirim"));
  orderStatusCategory.add(CPDataModel(orderStatus:"Dibatalkan"));
  orderStatusCategory.add(CPDataModel(orderStatus:"Kas Saya"));
  return orderStatusCategory;
}

class CPDataModel {
  String? cardName;
  String? image;
  String? orderStatus;
  String? currencyUnit;
  String? totalAmount;
  String? payStatus;
  Color? bgColor;
  Color? textColor;
  IconData? icon;

  CPDataModel({this.textColor, this.cardName, this.image, this.orderStatus, this.currencyUnit, this.payStatus, this.totalAmount, this.bgColor, this.icon});
}

List <Customer> getCustomerData(){
  List<Customer> customerData = [];
  customerData.add(Customer(id: 1, fName: 'Marry', lName: 'Rodie', phone: '0822551102'));
  customerData.add(Customer(id: 2, fName: 'Johny', lName: 'Pro', phone: '0835551102'));
  customerData.add(Customer(id: 3, fName: 'Commi', lName: 'Radig', phone: '5635551102'));
  customerData.add(Customer(id: 4, fName: 'Dusk', lName: 'Ward', phone: '75567'));

  return customerData;
}

List <OrderModel> getCustomerOrders(){
  List<OrderModel> customerOrders = [];
  List<Customer> customerList = getCustomerData();

  customerOrders.add(OrderModel(customer: customerList[0], id: 456718, accepted: "Diterima", paymentStatus: PaymentStatus.PAIDOFF.name, orderAmount: 750000, orderStatus: "Lunas"));
  customerOrders.add(OrderModel(customer: customerList[1], id: 567718, accepted: "Diterima", paymentStatus: PaymentStatus.PAIDOFF.name, orderAmount: 450000, orderStatus: "Lunas"));
  customerOrders.add(OrderModel(customer: customerList[2], id: 767758, accepted: "Diterima", paymentStatus: PaymentStatus.PAIDOFF.name, orderAmount: 850000, orderStatus: "Lunas"));
  customerOrders.add(OrderModel(customer: customerList[3], id: 867758, accepted: "Diterima", paymentStatus: PaymentStatus.PAIDOFF.name, orderAmount: 1750000, orderStatus: "Lunas"));

  return customerOrders;
}


