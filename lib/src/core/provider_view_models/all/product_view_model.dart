import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inki/src/core/api_data_models/product_master_api_model.dart';
import 'package:inki/src/core/api_repository/api_base_helper.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends BaseChangeNotifierModel {
  BuildContext context;

  ApiBaseHelper apiHelper;

  ProductMasterApiModel productMasterApiModel;
  List<CategoryData> mainCategories = [];
  List<ProductData> listOfProductData = [];
  ProductData productDetails;
  int productDetailsGroupIndex;

  Box productsBox;
  bool noInterNet = false;

  ProductViewModel(BuildContext context) {
    apiHelper = Provider.of<ApiBaseHelper>(context, listen: false);
  }

  getProductDetailsDependsOnIndex(Map<String, dynamic> productIds) async {
    setState(BaseViewState.Busy);
    await initProductsMasterBox();
    await getDataFromCache();
    var productId;
    var type;

    if (productIds != null) {
      productId = productIds["groupId"] ?? 0;
      type = productIds["type"] ?? "";

      if (type == "ac") {
        // productId = 6;
        for (int i = 0; i <= listOfProductData.length - 1; i++) {
          if (listOfProductData[i].productMainImage[0] ==
              "https://inspiredkinematics.com:2053/downloads/temp/AC_1.jpg") {
            productId = listOfProductData[i].productId;
          }
        }
      } else if (type == "vc") {
        productId = 0;
        for (int i = 0; i <= listOfProductData.length - 1; i++) {
          if (listOfProductData[i].productMainImage[0] ==
              "https://inspiredkinematics.com:2053/downloads/temp/adam.png") {
            productId = listOfProductData[i].productId;
          }
        }
      } else {}
    } else {
      productId = 0;
      type = "";
    }

    for (int i = 0; i <= listOfProductData.length - 1; i++) {
      if (listOfProductData[i].productId.toString() == productId.toString()) {
        productDetails = listOfProductData[i];
        break;
      }
    }

    setState(BaseViewState.Idle);

    notifyListeners();
  }

  getDataFromCache() async {
    await initProductsMasterBox();

    if (productsBox.get(0) != null) {
      if (productsBox.length > 0) {
        productMasterApiModel = productsBox.get(0) as ProductMasterApiModel;
        mainCategories = productMasterApiModel.data.categoryData;
        listOfProductData = productMasterApiModel.data.productData;
      }
    }

    notifyListeners();
  }

  initProductsMasterBox() async {
    try {
      if (productsBox == null || !productsBox.isOpen) {
        productsBox = await Hive.openBox<ProductMasterApiModel>(
            CommonStrings.productsHive);
      } else {
        if (productsBox != null && productsBox.isOpen) {
          productsBox =
              Hive.box<ProductMasterApiModel>(CommonStrings.productsHive);
        } else {}
      }
    } catch (e) {
      productsBox =
          await Hive.openBox<ProductMasterApiModel>(CommonStrings.productsHive);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
