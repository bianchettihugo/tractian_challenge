import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

/// Represents a location within the item tree.
class LocationEntity extends ItemEntity {
  LocationEntity({
    required super.id,
    required super.name,
    super.children,
    super.parentId,
  });
}
