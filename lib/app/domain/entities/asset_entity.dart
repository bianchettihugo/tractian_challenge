import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

/// Represents an asset within the item tree.
class AssetEntity extends ItemEntity {
  AssetEntity({
    required super.id,
    required super.name,
    super.parentId,
    super.children,
  });
}
