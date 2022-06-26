
import 'kas_model.dart';

List <TransactionModel> getTransactionList(){
  List<TransactionModel> transactionData = [];
  transactionData.add(TransactionModel(id: 0097, type: TransactionType.CashOut, title: "Bayar Kulakan", transactionAmount: 20000));
  transactionData.add(TransactionModel(id: 1097, type: TransactionType.CashOut, title: "Bayar Gaji Karyawan", transactionAmount: 50000));
  transactionData.add(TransactionModel(id: 1097, type: TransactionType.CashIn, title: "Dapat Gaji dari Serabutan", transactionAmount: 100000));

  return transactionData;
}

