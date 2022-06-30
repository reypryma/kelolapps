import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/route/route_helper.dart';

import 'feature_model.dart';

List<FeatureCategoryModel> getCategoryMenu() {
  List<FeatureCategoryModel > list = [];

  list.add(FeatureCategoryModel(id: 1, name: 'Laporan dan Kondisi Toko', image: KelolaImage.reportCategoryImage, route: RouteHelper.getStoreReportRoute()));
  list.add(FeatureCategoryModel(id: 2, name: 'Pelanggan Toko', image: KelolaImage.membershipCategoryImage, route: RouteHelper.getStoreBuyerRoute()));
  list.add(FeatureCategoryModel(id: 3, name: 'Kursus', image: KelolaImage.courseCategoryImage, route: RouteHelper.getCourseRoute()));
  list.add(FeatureCategoryModel(id: 4, name: 'Promo Toko', image: KelolaImage.promoCategoryImage, route: RouteHelper.getStorePromoRoute()));
  list.add(FeatureCategoryModel(id: 5, name: 'Atur Etalase Toko', image: KelolaImage.myShopCategoryImage, route: RouteHelper.getStoreSettingRoute()));
  list.add(FeatureCategoryModel(id: 6, name: 'Karyawan', image: KelolaImage.employeeCategoryImage, route: RouteHelper.getStoreEmployeeRoute()));
  list.add(FeatureCategoryModel(id: 7, name: 'Kampanye', image: KelolaImage.campaignCategoryImage, route: RouteHelper.getCampaignRoute()));
  list.add(FeatureCategoryModel(id: 8, name: 'Akun', image: KelolaImage.myAccountCategoryImage, route: RouteHelper.getAccountRoute()));

  // list.add(CategoryModel(id: 1, name: 'Laporan dan Kondisi Toko', image: KelolaImage.reportCategoryImage, route: RouteHelper.storeReport));
  // list.add(CategoryModel(id: 2, name: 'Pelanggan Toko', image: KelolaImage.membershipCategoryImage, route: RouteHelper.storeBuyer));
  // list.add(CategoryModel(id: 3, name: 'Kursus', image: KelolaImage.courseCategoryImage, route: RouteHelper.course));
  // list.add(CategoryModel(id: 4, name: 'Promo Toko', image: KelolaImage.promoCategoryImage, route: RouteHelper.storePromo));
  // list.add(CategoryModel(id: 5, name: 'Atur Etalase Toko', image: KelolaImage.myShopCategoryImage, route: RouteHelper.storeSetting));
  // list.add(CategoryModel(id: 6, name: 'Karyawan', image: KelolaImage.employeeCategoryImage, route: RouteHelper.storeEmployee));
  // list.add(CategoryModel(id: 7, name: 'Kampanye', image: KelolaImage.campaignCategoryImage, route: RouteHelper.campaign));
  // list.add(CategoryModel(id: 8, name: 'Akun', image: KelolaImage.myAccountCategoryImage, route: RouteHelper.account));


  return list;
}