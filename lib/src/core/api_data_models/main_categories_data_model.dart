import 'package:flutter/cupertino.dart';
import 'package:usb_serial/usb_serial.dart';

class UsbPortModel {
  // sample data model
  bool isFromHome;
  UsbPort portValue;
  List<dynamic> productsList;

  UsbPortModel({
    this.isFromHome,
    @required this.portValue,
    this.productsList,
  });
}

class MainCategoriesDataModel {
  String catName;
  String catLastName;
  String description;
  List<String> types;
  String imageSrc;

  List<SubCategoriesDataModel> subCategoriesData;

  MainCategoriesDataModel({
    @required this.catName,
    @required this.catLastName,
    @required this.description,
    @required this.types,
    @required this.imageSrc,
    @required this.subCategoriesData,
  });
}

class SubCategoriesDataModel {
  String subCatName;
  String description;
  String imageSrc;
  List<SubCategoriesProductsDataModel> subCatProducts;

  SubCategoriesDataModel({
    @required this.subCatName,
    @required this.description,
    @required this.imageSrc,
    @required this.subCatProducts,
  });
}

class TypeOfGroupDataModel {
  String typeOfGroup;

  TypeOfGroupDataModel({
    @required this.typeOfGroup,
  });
}

class SubCategoriesProductsDataModel {
  String productName;
  String subName;
  String imageSrc;
  String power;
  String weight;
  String offerPrice;
  String originalPrice;
  String discountPercent;

  SubCategoriesProductsDataModel({
    @required this.productName,
    @required this.subName,
    @required this.imageSrc,
    @required this.power,
    @required this.weight,
    @required this.offerPrice,
    @required this.originalPrice,
    @required this.discountPercent,
  });
}

class MainCategoriesDataSource {
  List<MainCategoriesDataModel> mainCatData = [
    MainCategoriesDataModel(
      catName: 'Laundry',
      catLastName: 'Solutions',
      description:
          'Give you clothes the attention they deserve with Laundry Solution from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataOne,
      imageSrc: 'assets/images/wash1.jpg',
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'Kitchen',
      catLastName: 'Solutions',
      description:
          'Give you clothes the attention they deserve with Laundry Solution from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataTwo,
      imageSrc: 'assets/images/wash2.jpg',
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'Living',
      catLastName: 'Solutions',
      description:
          'Bring a breath of fresh air into you home with living solutions from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataThree,
      imageSrc: "assets/images/machines_group.png",
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'IFB ',
      catLastName: 'Essentials',
      description:
          'Bring a breath of fresh air into you home with living solutions from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataFour,
      imageSrc: "assets/images/home.png",
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'AC',
      catLastName: 'Demo',
      description:
          'Give you clothes the attention they deserve with Laundry Solution from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataOne,
      imageSrc: 'assets/images/wash1.jpg',
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'VM',
      catLastName: 'Demo',
      description:
          'Give you clothes the attention they deserve with Laundry Solution from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataTwo,
      imageSrc: 'assets/images/wash2.jpg',
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
    MainCategoriesDataModel(
      catName: 'Living',
      catLastName: 'Solutions',
      description:
          'Bring a breath of fresh air into you home with living solutions from IFB',
      types: TypesOfGroupsMainCategoriesDataSource().typeOfGroupDataThree,
      imageSrc: "assets/images/machines_group.png",
      subCategoriesData: SubCategoriesDataSource().subCateData,
    ),
  ];
}

class SubCategoriesDataSource {
  List<SubCategoriesDataModel> subCateData = [
    SubCategoriesDataModel(
      subCatName: 'Top Load',
      description:
          "India's First wash program for delicate fabrics TOP LOAD WASHING MACHINES",
      imageSrc: "assets/images/machines_group.png",
      subCatProducts: SubCategoriesProductsDataSource().subcategoryProductsOne,
    ),
    SubCategoriesDataModel(
      subCatName: 'Front Load',
      description:
          "India's First wash program for delicate fabrics FRONT LOAD WASHING MACHINES",
      imageSrc: "assets/images/wash2.jpg",
      subCatProducts: SubCategoriesProductsDataSource().subcategoryProductsTwo,
    ),
    SubCategoriesDataModel(
      subCatName: 'Cloth Dryer',
      description:
          "India's First wash program for delicate fabrics TOP CLOSTH DRYER MACHINES",
      imageSrc: "assets/images/wash1.jpg",
      subCatProducts:
          SubCategoriesProductsDataSource().subcategoryProductsThree,
    ),
    SubCategoriesDataModel(
      subCatName: 'Top Load',
      description:
          "India's First wash program for delicate fabrics TOP LOAD WASHING MACHINES",
      imageSrc: "assets/images/machines_group.png",
      subCatProducts: SubCategoriesProductsDataSource().subcategoryProductsFour,
    ),
    SubCategoriesDataModel(
      subCatName: 'Front Load',
      description:
          "India's First wash program for delicate fabrics FRONT LOAD WASHING MACHINES",
      imageSrc: "assets/images/wash2.jpg",
      subCatProducts: SubCategoriesProductsDataSource().subcategoryProductsOne,
    ),
    SubCategoriesDataModel(
      subCatName: 'Cloth Dryer',
      description:
          "India's First wash program for delicate fabrics TOP CLOSTH DRYER MACHINES",
      imageSrc: "assets/images/wash1.jpg",
      subCatProducts: SubCategoriesProductsDataSource().subcategoryProductsTwo,
    ),
  ];
}

class TypesOfGroupsMainCategoriesDataSource {
  List<String> typeOfGroupDataOne = [
    "TOP LOAD",
    "FRONT LOAD",
    "CLOTHS DRYERS",
    "ACCESSORIES"
  ];
  List<String> typeOfGroupDataTwo = [
    "MICRO WAVES",
    "DISHWASHERS",
    "CHIMNEYS",
    "HOBS"
  ];
  List<String> typeOfGroupDataThree = [
    "DC INVERTER AC",
    "AC STABILIZERS",
    "CHIMNEYS",
    "HOBS"
  ];
  List<String> typeOfGroupDataFour = [
    "DC INVERTER AC",
    "AC STABILIZERS",
    "CHIMNEYS",
    "HOBS"
  ];
}

class SubCategoriesProductsDataSource {
  List<SubCategoriesProductsDataModel> subcategoryProductsOne = [
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "7.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro1.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Senorita WXS",
      subName: "",
      power: "1000 RPM",
      weight: "6.5kg",
      originalPrice: "50,000.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro2.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    )
  ];

  List<SubCategoriesProductsDataModel> subcategoryProductsTwo = [
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "7.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Senorita WXS",
      subName: "",
      power: "1000 RPM",
      weight: "6.5kg",
      originalPrice: "50,000.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro2.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro1.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro3.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/sub_pro3.png",
    )
  ];

  List<SubCategoriesProductsDataModel> subcategoryProductsThree = [
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "7.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Senorita WXS",
      subName: "",
      power: "1000 RPM",
      weight: "6.5kg",
      originalPrice: "50,000.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    )
  ];

  List<SubCategoriesProductsDataModel> subcategoryProductsFour = [
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "7.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Senorita WXS",
      subName: "",
      power: "1000 RPM",
      weight: "6.5kg",
      originalPrice: "50,000.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash1.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Eva ZX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/wash2.jpg",
    ),
    SubCategoriesProductsDataModel(
      productName: "Elite Plus SX",
      subName: "Eco converter",
      power: "1200 RPM",
      weight: "1.5kg",
      originalPrice: "44900.00",
      offerPrice: "\u20B9 40,500",
      discountPercent: "15%",
      imageSrc: "assets/images/machines_group.png",
    )
  ];
}
