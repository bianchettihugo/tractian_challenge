import 'package:tractian_challenge/app/data/builders/item_builder.dart';
import 'package:tractian_challenge/app/data/models/asset_model.dart';
import 'package:tractian_challenge/app/data/models/component_model.dart';
import 'package:tractian_challenge/app/data/models/item_model.dart';

/// Default implementation of [AssetBuilder]
/// Handle the rules for building assets depending on rules specified
/// in the challenge.
class AssetBuilder extends ItemBuilder {
  @override
  ItemModel build(Map<String, dynamic> map) {
    if (map.containsKey('sensorType')) {
      return ComponentModel.fromMap(map);
    }

    return AssetModel.fromMap(map);
  }
}
