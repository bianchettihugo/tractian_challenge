import 'package:tractian_challenge/app/data/models/item_model.dart';
import 'package:tractian_challenge/app/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

class AssetModel extends ItemModel {
  AssetModel({
    required super.id,
    required super.name,
    super.locationId,
    super.parentId,
  });

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'],
      name: map['name'],
      locationId: map['locationId'],
      parentId: map['parentId'],
    );
  }

  @override
  ItemEntity toEntity() {
    return AssetEntity(
      id: id,
      name: name,
      parentId: locationId ?? parentId,
      children: [],
    );
  }
}
