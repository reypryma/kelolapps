import 'package:flutter/material.dart';

enum PaymentStatus{
  PENDING, PAIDOFF
}

extension PaymentStatusExtension on PaymentStatus{
  String? get name{
    switch(this){
      case PaymentStatus.PENDING:
        return 'Belum Dibayar';
      case PaymentStatus.PAIDOFF:
        return 'Lunas';
    }
  }

}