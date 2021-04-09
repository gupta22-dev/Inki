import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/api_data_models/product_master_api_model.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';

class MainScreenProductsViewModel extends BaseChangeNotifierModel {
  BuildContext context;
  int restaurantId;
  String city = "";
  ScrollController restaurantMenuScrollView = ScrollController();
  ScrollController productsCategoriesScrollListener = ScrollController();
  double offset = 0.0;
  double top = 0.0;
  double scale = 1.0;
  bool showIcon = false;
  List<MainCategoriesDataModel> listOfMainCategories =
      MainCategoriesDataSource().mainCatData;
  Box productsBox;
  ProductMasterApiModel productMasterApiModel;
  List<CategoryData> mainCategories = [];

  MainScreenProductsViewModel(BuildContext context) {
    productsCategoriesScrollListener = ScrollController()..addListener(() {});
  }

  initProductsMasterBox() async {
    try {
      if (productsBox == null || !productsBox.isOpen) {
        showLog("initBox --");
        productsBox = await Hive.openBox<ProductMasterApiModel>(
            CommonStrings.productsHive);
      } else {
        if (productsBox != null && productsBox.isOpen) {
          showLog("initBox2 --");

          productsBox =
              Hive.box<ProductMasterApiModel>(CommonStrings.productsHive);
        } else {}
      }
    } catch (e) {
      showLog("initBox24 --");
      productsBox =
          await Hive.openBox<ProductMasterApiModel>(CommonStrings.productsHive);
    }
  }

  getDataFromCache() async {
    await initProductsMasterBox();
    mainCategories.clear();
    productMasterApiModel = productsBox.get(0) as ProductMasterApiModel;
    mainCategories = productMasterApiModel.data.categoryData;
    notifyListeners();
  }

  @override
  void dispose() {
    productsCategoriesScrollListener.dispose();
    super.dispose();
  }
}
