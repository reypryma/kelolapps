import 'package:kelolapps/config/kelolaku/constant.dart';
import 'package:kelolapps/data/model/productmodel/product_model.dart';

import 'CategoryData.dart';
import 'category_model.dart';

List<ProductModel> getProductList(){
  List<ProductCategoryModel> categories = getCategoryList();
  List<ProductModel> categoryData = [
    ProductModel(
        id: 8,
        description: "Chicken Specialties",
        name: "Chicken Rice Teriyaki",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/8.jpg",
        price: 50000,
        discount: 10,
        rating: 4.7,
        distance: 3.9,
        location: "Liberty Avenue", categoryModel: categories.elementAt(0)),
    ProductModel(
        id: 6,
        description: "Bread and Cookies",
        name: "Delicious Croissant",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/6.jpg",
        price: 75000,
        discount: 0,
        rating: 4.8,
        distance: 0.9,
        location: "Mapple Street", categoryModel: categories.elementAt(3)
    ),
    ProductModel(
        id: 7,
        description: "Taco Salad Beef Classic",
        name: "Awesome Health",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/7.jpg",
        price: 120000,
        discount: 10,
        rating: 4.9,
        distance: 1.1,
        location: "Fenimore Street", categoryModel: categories.elementAt(2)
    ),
    ProductModel(
        id: 5,
        description: "Italian Food",
        name: "Chicken Penne With Tomato",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/5.jpg",
        price: 65000,
        discount: 20,
        rating: 4.6,
        distance: 0.9,
        location: "New York Avenue", categoryModel: categories.elementAt(2)
    ),
    ProductModel(
        id: 4,
        description: "Steam Boat Lovers",
        name: "Seafood shabu-shabu",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/4.jpg",
        price: 30000,
        discount: 20,
        rating: 4.9,
        distance: 0.7,
        location: "Lefferts Avenue", categoryModel: categories.elementAt(2)
    ),
    ProductModel(
        id: 3,
        description: "Salad Stop",
        name: "Sesame Salad",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/3.jpg",
        price: 20000,
        discount: 10,
        rating: 4.3,
        distance: 0.7,
        location: "Empire Boulevard", categoryModel: categories.elementAt(2)
    ),
    ProductModel(
        id: 2,
        description: "Beef Lovers",
        name: "Beef Yakiniku",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/2.jpg",
        price: 15000,
        discount: 20,
        rating: 5,
        distance: 0.6,
        location: "Montgomery Street", categoryModel: categories.elementAt(2)
    ),
    ProductModel(
        id: 1,
        description: "Mr. Hungry",
        name: "Hainam Chicken Rice",
        image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/1.jpg",
        price: 100000,
        discount: 50,
        rating: 4.9,
        distance: 0.4,
        location: "Crown Street", categoryModel: categories.elementAt(2)
    ),
  ];
  return categoryData;
}
