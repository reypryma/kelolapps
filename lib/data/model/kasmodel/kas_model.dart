class TransactionModel {
  int? id;
  TransactionType type;
  String? personInfo;
  String? contactInfo;
  double? transactionAmount;
  String? title;
  String? description;

  TransactionModel(
      {this.id, this.title, this.description, this.personInfo, this.contactInfo, this.transactionAmount,
        required this.type});

  // factory TransactionModel.fromJson(Map<String, dynamic> json) {
  //   return TransactionModel(
  //     id: json['Id'], type: (json['transaction_type']),
  //
  //     // attribute_value_ids: json['AttributeValueIds'],
  //
  //     // productId: json['ProductId'],
  //     // attr_name: json['AttrName'],
  //     // varient_value: json['VariantValues'],
  //     // disPrice: json['SpecialPrice'],
  //     // price: json['Price'],
  //     // availability: json['Availability'].toString(),
  //     // cartCount: json['CartCount'],
  //     // stock: json['Stock'],
  //     // stockType: json['Status'],
  //     // sku: json['sku'],
  //   );
  // }
}


enum TransactionType{
  CashOut, CashIn
}

extension TransactionTypeExtension on TransactionType{
  String? get name{
    switch(this){
      case TransactionType.CashIn:
        return 'Kas Masuk';
      case TransactionType.CashOut:
        return 'Kas Keluar';
    }
  }
}