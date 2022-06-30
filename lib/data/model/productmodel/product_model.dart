import 'package:kelolapps/data/model/productmodel/category_model.dart';

class ProductModel {
  late int id;
  late String name;
  String? description;
  double price;
  String image;
  double? rating;
  double? distance;
  int? discount;
  String? location;
  late ProductCategoryModel categoryModel;

  ProductModel({required this.id, required this.name, required this.description, required this.price, required this.image, this.rating, this.distance, required this.discount, required this.location, required this.categoryModel});
}