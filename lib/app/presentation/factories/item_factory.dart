import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/app/domain/entities/component_entity.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/entities/location_entity.dart';
import 'package:tractian_challenge/app/presentation/widgets/component_item.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

/// Abstract factory to allow different item types to
/// specify how they should be displayed.
abstract class ItemFactory {
  Widget build({
    required BuildContext context,
    required ItemEntity item,
  });
}

class ItemFactoryImpl extends ItemFactory {
  Widget _buildIconItem(BuildContext context, ItemEntity item, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: context.scheme.primary,
          size: 32,
        ),
        const SizedBox(width: 10),
        Text(
          item.name,
          overflow: TextOverflow.ellipsis,
          style: context.text.bodyMedium?.copyWith(
            color: context.scheme.onSurface,
          ),
        )
      ],
    );
  }

  @override
  Widget build({
    required BuildContext context,
    required ItemEntity item,
  }) {
    switch (item.runtimeType) {
      case const (LocationEntity):
        return _buildIconItem(context, item, Icons.location_on_outlined);
      case const (AssetEntity):
        return _buildIconItem(context, item, Icons.archive_outlined);
      case const (ComponentEntity):
        return ComponentItem(component: item as ComponentEntity);
      default:
        return Text(
          item.name,
          style: context.text.bodyMedium?.copyWith(
            color: context.scheme.onSurface,
          ),
        );
    }
  }
}
