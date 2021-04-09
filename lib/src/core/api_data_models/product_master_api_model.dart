import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_master_api_model.g.dart';

ProductMasterApiModel productMasterApiModelFromJson(str) =>
    ProductMasterApiModel.fromJson(json.decode(str));

String productMasterApiModelToJson(ProductMasterApiModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class ProductMasterApiModel {
  bool status;
  @HiveField(0)
  Data data;

  ProductMasterApiModel({this.status, this.data});

  ProductMasterApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  List<CategoryData> categoryData;
  @HiveField(1)
  List<ProductData> productData;

  Data({this.categoryData, this.productData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categoryData'] != null) {
      categoryData = new List<CategoryData>();
      json['categoryData'].forEach((v) {
        categoryData.add(new CategoryData.fromJson(v));
      });
    }
    if (json['productData'] != null) {
      productData = new List<ProductData>();
      json['productData'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryData != null) {
      data['categoryData'] = this.categoryData.map((v) => v.toJson()).toList();
    }
    if (this.productData != null) {
      data['productData'] = this.productData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class CategoryData {
  @HiveField(0)
  int subCategoryId;
  @HiveField(1)
  int categoryId;
  @HiveField(2)
  String subCategory;
  @HiveField(3)
  String description;
  @HiveField(4)
  String imageMain;
  @HiveField(5)
  String imageBanner;
  @HiveField(6)
  List<GroupMasters> groupMasters;
  @HiveField(7)
  int seqNo;

  CategoryData(
      {this.subCategoryId,
      this.categoryId,
      this.subCategory,
      this.description,
      this.imageMain,
      this.imageBanner,
      this.groupMasters,
      this.seqNo});

  CategoryData.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['SubCategoryId'] ?? "";
    categoryId = json['CategoryId'] ?? "";
    subCategory = json['SubCategory'] ?? "";
    description = json['Description'] ?? "";
    imageMain = json['ImageMain'] ?? "";
    imageBanner = json['ImageBanner'] ?? "";
    if (json['GroupMasters'] != null) {
      groupMasters = new List<GroupMasters>();
      json['GroupMasters'].forEach((v) {
        groupMasters.add(new GroupMasters.fromJson(v));
      });
    }
    seqNo = json['SeqNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubCategoryId'] = this.subCategoryId;
    data['CategoryId'] = this.categoryId;
    data['SubCategory'] = this.subCategory;
    data['Description'] = this.description;
    data['ImageMain'] = this.imageMain;
    data['ImageBanner'] = this.imageBanner;
    if (this.groupMasters != null) {
      data['GroupMasters'] = this.groupMasters.map((v) => v.toJson()).toList();
    }
    data['SeqNo'] = this.seqNo;
    return data;
  }
}

@HiveType(typeId: 3)
class GroupMasters {
  @HiveField(0)
  int groupId;
  @HiveField(1)
  int subCategoryId;
  @HiveField(2)
  String group;
  @HiveField(3)
  String description;
  @HiveField(4)
  dynamic imageMain;
  @HiveField(5)
  dynamic imageBanner;
  @HiveField(6)
  List<ProductMasters> productMasters;

  GroupMasters(
      {this.groupId,
      this.subCategoryId,
      this.group,
      this.description,
      this.imageMain,
      this.imageBanner,
      this.productMasters});

  GroupMasters.fromJson(Map<String, dynamic> json) {
    groupId = json['GroupId'] ?? "";
    ;
    subCategoryId = json['SubCategoryId'] ?? "";
    ;
    group = json['Group'] ?? "";
    ;
    description = json['Description'] ?? "";
    ;
    imageMain = json['ImageMain'] ?? "";
    ;
    imageBanner = json['ImageBanner'] ?? "";
    ;
    if (json['ProductMasters'] != null) {
      productMasters = new List<ProductMasters>();
      json['ProductMasters'].forEach((v) {
        productMasters.add(new ProductMasters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GroupId'] = this.groupId;
    data['SubCategoryId'] = this.subCategoryId;
    data['Group'] = this.group;
    data['Description'] = this.description;
    data['ImageMain'] = this.imageMain;
    data['ImageBanner'] = this.imageBanner;
    if (this.productMasters != null) {
      data['ProductMasters'] =
          this.productMasters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 4)
class ProductMasters {
  @HiveField(0)
  int productId;
  @HiveField(1)
  int groupId;
  @HiveField(2)
  String productName;
  @HiveField(3)
  String modelName;
  @HiveField(4)
  List<String> bulletPoints;
  @HiveField(5)
  List<String> productMainImage;
  @HiveField(6)
  dynamic productImages;
  @HiveField(7)
  String baseColor;
  @HiveField(8)
  int price;
  @HiveField(9)
  String discountPercent;
  @HiveField(10)
  int seqNo;
  @HiveField(11)
  String qRCode;

  ProductMasters(
      {this.productId,
      this.groupId,
      this.productName,
      this.modelName,
      this.bulletPoints,
      this.productMainImage,
      this.productImages,
      this.baseColor,
      this.price,
      this.discountPercent,
      this.seqNo,
      this.qRCode});

  ProductMasters.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'] ?? "";
    groupId = json['GroupId'] ?? "";
    productName = json['ProductName'] ?? "";
    modelName = json['ModelName'] ?? "";
    bulletPoints = json['BulletPoints'].cast<String>();
    productMainImage = json['ProductMainImage'].cast<String>();
    productImages = json['ProductImages'] ?? "";
    baseColor = json['BaseColor'] ?? "";
    price = json['Price'] ?? "";
    discountPercent = json['DiscountPercent'] ?? "";
    seqNo = json['SeqNo'];
    qRCode = json['QRCode'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['GroupId'] = this.groupId;
    data['ProductName'] = this.productName;
    data['ModelName'] = this.modelName;
    data['BulletPoints'] = this.bulletPoints;
    data['ProductMainImage'] = this.productMainImage;
    data['ProductImages'] = this.productImages;
    data['BaseColor'] = this.baseColor;
    data['Price'] = this.price;
    data['DiscountPercent'] = this.discountPercent;
    data['SeqNo'] = this.seqNo;
    data['QRCode'] = this.qRCode;
    return data;
  }
}

@HiveType(typeId: 5)
class ProductData {
  @HiveField(0)
  int productId;
  @HiveField(1)
  int groupId;
  @HiveField(2)
  String productName;
  @HiveField(3)
  String modelName;
  @HiveField(4)
  List<String> bulletPoints;
  @HiveField(5)
  List<String> productMainImage;
  @HiveField(6)
  dynamic productImages;
  @HiveField(7)
  String baseColor;
  @HiveField(8)
  int price;
  @HiveField(9)
  String discountPercent;
  @HiveField(10)
  bool isDeleted;
  @HiveField(11)
  int createdBy;
  @HiveField(12)
  dynamic lastUpdatedBy;
  @HiveField(13)
  String createdDate;
  @HiveField(14)
  String lastUpdatedDate;
  @HiveField(15)
  List<ProductFeatures> productFeatures;
  @HiveField(16)
  List<ProductProperties> productProperties;
  @HiveField(17)
  List<ProductSpecifications> productSpecifications;
  @HiveField(18)
  int seqNo;
  @HiveField(19)
  String qRCode;

  ProductData({
    this.productId,
    this.groupId,
    this.productName,
    this.modelName,
    this.bulletPoints,
    this.productMainImage,
    this.productImages,
    this.baseColor,
    this.price,
    this.discountPercent,
    this.isDeleted,
    this.createdBy,
    this.lastUpdatedBy,
    this.createdDate,
    this.lastUpdatedDate,
    this.productFeatures,
    this.productProperties,
    this.productSpecifications,
    this.seqNo,
    this.qRCode,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'] ?? "";
    groupId = json['GroupId'] ?? "";
    productName = json['ProductName'] ?? "";
    modelName = json['ModelName'] ?? "";
    bulletPoints = json['BulletPoints'].cast<String>();
    productMainImage = json['ProductMainImage'].cast<String>();
    productImages = json['ProductImages'] ?? "";
    seqNo = json['SeqNo'] ?? "";
    baseColor = json['BaseColor'] ?? "";
    price = json['Price'] ?? "";
    discountPercent = json['DiscountPercent'] ?? "";
    isDeleted = json['IsDeleted'] ?? "";
    createdBy = json['CreatedBy'] ?? "";
    lastUpdatedBy = json['LastUpdatedBy'] ?? "";
    createdDate = json['CreatedDate'] ?? "";
    lastUpdatedDate = json['LastUpdatedDate'] ?? "";
    if (json['ProductFeatures'] != null) {
      productFeatures = new List<ProductFeatures>();
      json['ProductFeatures'].forEach((v) {
        productFeatures.add(new ProductFeatures.fromJson(v));
      });
    }
    if (json['ProductProperties'] != null) {
      productProperties = new List<ProductProperties>();
      json['ProductProperties'].forEach((v) {
        productProperties.add(new ProductProperties.fromJson(v));
      });
    }
    if (json['ProductSpecifications'] != null) {
      productSpecifications = new List<ProductSpecifications>();
      json['ProductSpecifications'].forEach((v) {
        productSpecifications.add(new ProductSpecifications.fromJson(v));
      });
    }
    qRCode = json['QRCode'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['GroupId'] = this.groupId;
    data['ProductName'] = this.productName;
    data['ModelName'] = this.modelName;

    data['BulletPoints'] = this.bulletPoints;
    data['ProductMainImage'] = this.productMainImage;
    data['ProductImages'] = this.productImages;
    data['BaseColor'] = this.baseColor;
    data['Price'] = this.price;
    data['DiscountPercent'] = this.discountPercent;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['CreatedDate'] = this.createdDate;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['QRCode'] = this.qRCode;
    if (this.productFeatures != null) {
      data['ProductFeatures'] =
          this.productFeatures.map((v) => v.toJson()).toList();
    }
    if (this.productProperties != null) {
      data['ProductProperties'] =
          this.productProperties.map((v) => v.toJson()).toList();
    }
    if (this.productSpecifications != null) {
      data['ProductSpecifications'] =
          this.productSpecifications.map((v) => v.toJson()).toList();
    }
    data['SeqNo'] = this.seqNo;
    return data;
  }
}

@HiveType(typeId: 6)
class ProductFeatures {
  @HiveField(0)
  int productFeatureId;
  @HiveField(1)
  int subCategoryId;
  @HiveField(2)
  int productId;
  @HiveField(3)
  int featureId;
  @HiveField(4)
  String image;
  @HiveField(5)
  List<dynamic> description;
  @HiveField(6)
  FeatureMaster featureMaster;

  ProductFeatures(
      {this.productFeatureId,
      this.subCategoryId,
      this.productId,
      this.featureId,
      this.image,
      this.description,
      this.featureMaster});

  ProductFeatures.fromJson(Map<String, dynamic> json) {
    productFeatureId = json['ProductFeatureId'];
    subCategoryId = json['SubCategoryId'];
    productId = json['ProductId'];
    featureId = json['FeatureId'];
    image = json['Image'];
    description = json['Description'];
    featureMaster = json['FeatureMaster'] != null
        ? new FeatureMaster.fromJson(json['FeatureMaster'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductFeatureId'] = this.productFeatureId;
    data['SubCategoryId'] = this.subCategoryId;
    data['ProductId'] = this.productId;
    data['FeatureId'] = this.featureId;
    data['Image'] = this.image;
    data['Description'] = this.description;
    if (this.featureMaster != null) {
      data['FeatureMaster'] = this.featureMaster.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 7)
class FeatureMaster {
  @HiveField(0)
  int featureId;
  @HiveField(1)
  dynamic subCategoryId;
  @HiveField(2)
  String feature;

  FeatureMaster({this.featureId, this.subCategoryId, this.feature});

  FeatureMaster.fromJson(Map<String, dynamic> json) {
    featureId = json['FeatureId'] ?? "";
    subCategoryId = json['SubCategoryId'] ?? "";
    feature = json['Feature'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FeatureId'] = this.featureId;
    data['SubCategoryId'] = this.subCategoryId;
    data['Feature'] = this.feature;
    return data;
  }
}

@HiveType(typeId: 8)
class ProductProperties {
  @HiveField(0)
  int productPropertyId;
  @HiveField(1)
  int subCategoryId;
  @HiveField(2)
  int productId;
  @HiveField(3)
  int propertyId;
  @HiveField(4)
  String propertyValue;
  @HiveField(5)
  PropertyMaster propertyMaster;

  ProductProperties(
      {this.productPropertyId,
      this.subCategoryId,
      this.productId,
      this.propertyId,
      this.propertyValue,
      this.propertyMaster});

  ProductProperties.fromJson(Map<String, dynamic> json) {
    productPropertyId = json['ProductPropertyId'] ?? "";
    subCategoryId = json['SubCategoryId'] ?? "";
    productId = json['ProductId'] ?? "";
    propertyId = json['PropertyId'] ?? "";
    propertyValue = json['PropertyValue'] ?? "";
    propertyMaster = json['PropertyMaster'] != null
        ? new PropertyMaster.fromJson(json['PropertyMaster'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductPropertyId'] = this.productPropertyId;
    data['SubCategoryId'] = this.subCategoryId;
    data['ProductId'] = this.productId;
    data['PropertyId'] = this.propertyId;
    data['PropertyValue'] = this.propertyValue;
    if (this.propertyMaster != null) {
      data['PropertyMaster'] = this.propertyMaster.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 9)
class PropertyMaster {
  @HiveField(0)
  int propertyId;
  @HiveField(1)
  dynamic subCategoryId;
  @HiveField(2)
  String property;

  PropertyMaster({this.propertyId, this.subCategoryId, this.property});

  PropertyMaster.fromJson(Map<String, dynamic> json) {
    propertyId = json['PropertyId'] ?? "";
    subCategoryId = json['SubCategoryId'] ?? "";
    property = json['Property'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PropertyId'] = this.propertyId;
    data['SubCategoryId'] = this.subCategoryId;
    data['Property'] = this.property;
    return data;
  }
}

@HiveType(typeId: 10)
class ProductSpecifications {
  @HiveField(0)
  int productSpecificationId;
  @HiveField(1)
  int subCategoryId;
  @HiveField(2)
  int productId;
  @HiveField(3)
  int specificationId;
  @HiveField(4)
  String description;
  @HiveField(5)
  SpecificationMaster specificationMaster;

  ProductSpecifications(
      {this.productSpecificationId,
      this.subCategoryId,
      this.productId,
      this.specificationId,
      this.description,
      this.specificationMaster});

  ProductSpecifications.fromJson(Map<String, dynamic> json) {
    productSpecificationId = json['ProductSpecificationId'] ?? "";
    subCategoryId = json['SubCategoryId'] ?? "";
    productId = json['ProductId'] ?? "";
    specificationId = json['SpecificationId'] ?? "";
    description = json['Description'] ?? "";
    specificationMaster = json['SpecificationMaster'] != null
        ? new SpecificationMaster.fromJson(json['SpecificationMaster'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductSpecificationId'] = this.productSpecificationId;
    data['SubCategoryId'] = this.subCategoryId;
    data['ProductId'] = this.productId;
    data['SpecificationId'] = this.specificationId;
    data['Description'] = this.description;
    if (this.specificationMaster != null) {
      data['SpecificationMaster'] = this.specificationMaster.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 11)
class SpecificationMaster {
  @HiveField(0)
  int specificationId;
  @HiveField(1)
  dynamic subCategoryId;
  @HiveField(2)
  String specification;

  SpecificationMaster(
      {this.specificationId, this.subCategoryId, this.specification});

  SpecificationMaster.fromJson(Map<String, dynamic> json) {
    specificationId = json['SpecificationId'] ?? "";
    subCategoryId = json['SubCategoryId'] ?? "";
    specification = json['Specification'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SpecificationId'] = this.specificationId;
    data['SubCategoryId'] = this.subCategoryId;
    data['Specification'] = this.specification;
    return data;
  }
}
