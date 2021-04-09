// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_master_api_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductMasterApiModelAdapter extends TypeAdapter<ProductMasterApiModel> {
  @override
  final int typeId = 0;

  @override
  ProductMasterApiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductMasterApiModel(
      data: fields[0] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, ProductMasterApiModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductMasterApiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      categoryData: (fields[0] as List)?.cast<CategoryData>(),
      productData: (fields[1] as List)?.cast<ProductData>(),
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryData)
      ..writeByte(1)
      ..write(obj.productData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryDataAdapter extends TypeAdapter<CategoryData> {
  @override
  final int typeId = 2;

  @override
  CategoryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryData(
      subCategoryId: fields[0] as int,
      categoryId: fields[1] as int,
      subCategory: fields[2] as String,
      description: fields[3] as String,
      imageMain: fields[4] as String,
      imageBanner: fields[5] as String,
      groupMasters: (fields[6] as List)?.cast<GroupMasters>(),
      seqNo: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.subCategoryId)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.subCategory)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imageMain)
      ..writeByte(5)
      ..write(obj.imageBanner)
      ..writeByte(6)
      ..write(obj.groupMasters)
      ..writeByte(7)
      ..write(obj.seqNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupMastersAdapter extends TypeAdapter<GroupMasters> {
  @override
  final int typeId = 3;

  @override
  GroupMasters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupMasters(
      groupId: fields[0] as int,
      subCategoryId: fields[1] as int,
      group: fields[2] as String,
      description: fields[3] as String,
      imageMain: fields[4] as dynamic,
      imageBanner: fields[5] as dynamic,
      productMasters: (fields[6] as List)?.cast<ProductMasters>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupMasters obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.group)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imageMain)
      ..writeByte(5)
      ..write(obj.imageBanner)
      ..writeByte(6)
      ..write(obj.productMasters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupMastersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductMastersAdapter extends TypeAdapter<ProductMasters> {
  @override
  final int typeId = 4;

  @override
  ProductMasters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductMasters(
      productId: fields[0] as int,
      groupId: fields[1] as int,
      productName: fields[2] as String,
      modelName: fields[3] as String,
      bulletPoints: (fields[4] as List)?.cast<String>(),
      productMainImage: (fields[5] as List)?.cast<String>(),
      productImages: fields[6] as dynamic,
      baseColor: fields[7] as String,
      price: fields[8] as int,
      discountPercent: fields[9] as String,
      seqNo: fields[10] as int,
      qRCode: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductMasters obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.modelName)
      ..writeByte(4)
      ..write(obj.bulletPoints)
      ..writeByte(5)
      ..write(obj.productMainImage)
      ..writeByte(6)
      ..write(obj.productImages)
      ..writeByte(7)
      ..write(obj.baseColor)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.discountPercent)
      ..writeByte(10)
      ..write(obj.seqNo)
      ..writeByte(11)
      ..write(obj.qRCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductMastersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductDataAdapter extends TypeAdapter<ProductData> {
  @override
  final int typeId = 5;

  @override
  ProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductData(
      productId: fields[0] as int,
      groupId: fields[1] as int,
      productName: fields[2] as String,
      modelName: fields[3] as String,
      bulletPoints: (fields[4] as List)?.cast<String>(),
      productMainImage: (fields[5] as List)?.cast<String>(),
      productImages: fields[6] as dynamic,
      baseColor: fields[7] as String,
      price: fields[8] as int,
      discountPercent: fields[9] as String,
      isDeleted: fields[10] as bool,
      createdBy: fields[11] as int,
      lastUpdatedBy: fields[12] as dynamic,
      createdDate: fields[13] as String,
      lastUpdatedDate: fields[14] as String,
      productFeatures: (fields[15] as List)?.cast<ProductFeatures>(),
      productProperties: (fields[16] as List)?.cast<ProductProperties>(),
      productSpecifications:
          (fields[17] as List)?.cast<ProductSpecifications>(),
      seqNo: fields[18] as int,
      qRCode: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductData obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.modelName)
      ..writeByte(4)
      ..write(obj.bulletPoints)
      ..writeByte(5)
      ..write(obj.productMainImage)
      ..writeByte(6)
      ..write(obj.productImages)
      ..writeByte(7)
      ..write(obj.baseColor)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.discountPercent)
      ..writeByte(10)
      ..write(obj.isDeleted)
      ..writeByte(11)
      ..write(obj.createdBy)
      ..writeByte(12)
      ..write(obj.lastUpdatedBy)
      ..writeByte(13)
      ..write(obj.createdDate)
      ..writeByte(14)
      ..write(obj.lastUpdatedDate)
      ..writeByte(15)
      ..write(obj.productFeatures)
      ..writeByte(16)
      ..write(obj.productProperties)
      ..writeByte(17)
      ..write(obj.productSpecifications)
      ..writeByte(18)
      ..write(obj.seqNo)
      ..writeByte(19)
      ..write(obj.qRCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductFeaturesAdapter extends TypeAdapter<ProductFeatures> {
  @override
  final int typeId = 6;

  @override
  ProductFeatures read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductFeatures(
      productFeatureId: fields[0] as int,
      subCategoryId: fields[1] as int,
      productId: fields[2] as int,
      featureId: fields[3] as int,
      image: fields[4] as String,
      description: (fields[5] as List)?.cast<dynamic>(),
      featureMaster: fields[6] as FeatureMaster,
    );
  }

  @override
  void write(BinaryWriter writer, ProductFeatures obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.productFeatureId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.featureId)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.featureMaster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFeaturesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeatureMasterAdapter extends TypeAdapter<FeatureMaster> {
  @override
  final int typeId = 7;

  @override
  FeatureMaster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeatureMaster(
      featureId: fields[0] as int,
      subCategoryId: fields[1] as dynamic,
      feature: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeatureMaster obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.featureId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.feature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureMasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductPropertiesAdapter extends TypeAdapter<ProductProperties> {
  @override
  final int typeId = 8;

  @override
  ProductProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductProperties(
      productPropertyId: fields[0] as int,
      subCategoryId: fields[1] as int,
      productId: fields[2] as int,
      propertyId: fields[3] as int,
      propertyValue: fields[4] as String,
      propertyMaster: fields[5] as PropertyMaster,
    );
  }

  @override
  void write(BinaryWriter writer, ProductProperties obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productPropertyId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.propertyId)
      ..writeByte(4)
      ..write(obj.propertyValue)
      ..writeByte(5)
      ..write(obj.propertyMaster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PropertyMasterAdapter extends TypeAdapter<PropertyMaster> {
  @override
  final int typeId = 9;

  @override
  PropertyMaster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PropertyMaster(
      propertyId: fields[0] as int,
      subCategoryId: fields[1] as dynamic,
      property: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PropertyMaster obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.propertyId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.property);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyMasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductSpecificationsAdapter extends TypeAdapter<ProductSpecifications> {
  @override
  final int typeId = 10;

  @override
  ProductSpecifications read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductSpecifications(
      productSpecificationId: fields[0] as int,
      subCategoryId: fields[1] as int,
      productId: fields[2] as int,
      specificationId: fields[3] as int,
      description: fields[4] as String,
      specificationMaster: fields[5] as SpecificationMaster,
    );
  }

  @override
  void write(BinaryWriter writer, ProductSpecifications obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productSpecificationId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.specificationId)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.specificationMaster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSpecificationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecificationMasterAdapter extends TypeAdapter<SpecificationMaster> {
  @override
  final int typeId = 11;

  @override
  SpecificationMaster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecificationMaster(
      specificationId: fields[0] as int,
      subCategoryId: fields[1] as dynamic,
      specification: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpecificationMaster obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.specificationId)
      ..writeByte(1)
      ..write(obj.subCategoryId)
      ..writeByte(2)
      ..write(obj.specification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecificationMasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
