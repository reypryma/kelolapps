import 'package:kelolapps/data/model/menumodel/feature_model.dart';
import 'package:kelolapps/data/model/productmodel/category_model.dart';

List<ProductCategoryModel> getCategoryList(){
  List<ProductCategoryModel> categoryData =[
    ProductCategoryModel(
      id: 1,
      name: 'Fashion',
    ),
    ProductCategoryModel(
      id: 2,
      name: 'Smartphone & Tablets',
    ),
    ProductCategoryModel(
      id: 3,
      name: 'Electronic',
    ),
    ProductCategoryModel(
      id: 4,
      name: 'Otomotif',
    ),
    ProductCategoryModel(
      id: 5,
      name: 'Sport',
    ),
    ProductCategoryModel(
      id: 6,
      name: 'Food',
    ),
    ProductCategoryModel(
      id: 7,
      name: 'Voucher\nGame',
    ),
    ProductCategoryModel(
      id: 8,
      name: 'Health & Care',
    ),
  ];
  return categoryData;
}