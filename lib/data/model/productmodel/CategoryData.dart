import 'package:kelolapps/data/model/menumodel/feature_model.dart';
import 'package:kelolapps/data/model/productmodel/category_model.dart';

List<ProductCategoryModel> getCategoryList(){
  List<ProductCategoryModel> categoryData =[
    ProductCategoryModel(
      id: 1,
      name: 'Izakaya',
    ),
    ProductCategoryModel(
      id: 2,
      name: 'Sashimi',
    ),
    ProductCategoryModel(
      id: 3,
      name: 'Sea Food',
    ),
    ProductCategoryModel(
      id: 4,
      name: 'Beverages',
    ),
    ProductCategoryModel(
      id: 5,
      name: 'Minuman',
    ),
    ProductCategoryModel(
      id: 6,
      name: 'Signature',
    ),
    ProductCategoryModel(
      id: 7,
      name: 'Gudeg\nGado',
    ),
    ProductCategoryModel(
      id: 8,
      name: 'Sehati',
    ),
  ];
  return categoryData;
}

List<bool> getInitialSelectedCategoryCount(){
  List<bool> categoryData = [];
  for(int i = 0 ; i < getCategoryList().length ; i++){
    categoryData.add(false);
  }
  return categoryData;
}
