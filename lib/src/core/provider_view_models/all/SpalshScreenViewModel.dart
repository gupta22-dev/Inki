import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inki/src/core/api_data_models/product_master_api_model.dart';
import 'package:inki/src/core/api_repository/api_base_helper.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/constants/common_strings.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';
import 'package:provider/provider.dart';

class SplashScreenViewModel extends BaseChangeNotifierModel {
  // view model for all products ,categories,sub products and product details - it will give data to ui
  BuildContext context;
  int restaurantId;
  String city = "";
  ApiBaseHelper apiHelper;
  ScrollController productsCategoriesScrollListener = ScrollController();
  double offset = 0.0;
  double top = 0.0;
  double scale = 1.0;
  bool showIcon = false;

  bool showProgress = true;

  ProductMasterApiModel productMasterApiModel;
  List<CategoryData> mainCategories = [];
  List<ProductMasters> productsData = [];
  List<GroupMasters> subCategoryMasters = [];
  ProductMasters productDetails;
  int productDetailsGroupIndex;

  Box productsBox;
  bool noInterNet = false;

  SplashScreenViewModel(BuildContext context) {
    apiHelper = Provider.of<ApiBaseHelper>(context, listen: false);
  }

  updateFilter(bool value) {
    notifyListeners();
  }

  getProductDetailsDependsOnIndex(Map<String, dynamic> productIds) async {
    await initProductsMasterBox();
    await getDataFromCache();
    var productId;
    var type;

    if (productIds != null) {
      productId = productIds["groupId"];
      type = productIds["type"];
    } else {
      productId = 0;
      type = "";
    }

    mainCategories.asMap().forEach((key, value) {
      if (value.groupMasters[0].productMasters[0].productId == productId) {
        productDetails = productsData[key];
      }
    });

    showLog(
        "productDetails-${productId}-${productDetails.productName} --${productDetails.productId}--${productDetails.productMainImage.length}--${productDetails.bulletPoints.length}-"
        "-${productDetails.discountPercent}--${productDetails.discountPercent}--${productDetails.price}");

    notifyListeners();
  }

  Future<ProductMasterApiModel> callApiForMasterProducts(
      {BuildContext mContext}) async {
    // call api to get all categories
    try {
      final response = await apiHelper.apiRequest(
          url: masterProductsUrl, urlType: getUrl, context: mContext);

      showLog("RestaurantDetailsModel $response");

      return compute(productMasterApiModelFromJson, response);
    } catch (error) {
      showLog("SocketException ${error.toString()}");

      showProgress = false;
      noInterNet = true;
      return null;
    }
  }

  getDataFromApiAndCache({BuildContext mContext, bool initial}) async {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      await callApi(mContext, initial);
    });

    await callApi(mContext, initial);

    if (productMasterApiModel != null && mainCategories.length > 0) {
      showProgress = false;
    } else {
      showProgress = false;
    }

    notifyListeners();
  }

  callApi(BuildContext mContext, bool initial) async {
    await callApiForMasterProducts(mContext: mContext).then((value) async {
      if (value != null) {
        await initProductsMasterBox();
        await productsBox.clear();
        await productsBox.add(value);
        await getDataFromCache();
        noInterNet = false;
        showProgress = false;

        Navigator.pushReplacementNamed(mContext, mainCategoriesScreen);
      } else {
        showProgress = false;
        noInterNet = true;
      }
    });
    notifyListeners();
  }

  getDataFromCache() async {
    await initProductsMasterBox();

    if (productsBox.get(0) != null) {
      if (productsBox.length > 0) {
        productMasterApiModel = productsBox.get(0) as ProductMasterApiModel;
        mainCategories = productMasterApiModel.data.categoryData;
      }
    }

    notifyListeners();
  }

  initProductsMasterBox() async {
    // initialize box to cache data. (hive - nosql database)
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

  @override
  void dispose() {
    productsCategoriesScrollListener.dispose();
    super.dispose();
  }
}
