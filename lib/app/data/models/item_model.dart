import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

class ItemModel {
  final String id;
  final String name;
  final String? parentId;
  final String? locationId;

  ItemModel({
    required this.id,
    required this.name,
    this.locationId,
    this.parentId,
  });

  ItemEntity toEntity() {
    return ItemEntity(
      id: id,
      name: name,
      parentId: parentId,
      children: <ItemEntity>[],
    );
  }
}
