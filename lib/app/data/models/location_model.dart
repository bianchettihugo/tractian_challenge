import 'package:tractian_challenge/app/data/models/item_model.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/entities/location_entity.dart';

class LocationModel extends ItemModel {
  LocationModel({
    required super.id,
    required super.name,
    super.locationId,
    super.parentId,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'],
      name: map['name'],
      locationId: map['locationId'],
      parentId: map['parentId'],
    );
  }

  @override
  ItemEntity toEntity() {
    return LocationEntity(
      id: id,
      name: name,
      parentId: locationId ?? parentId,
      children: [],
    );
  }
}
