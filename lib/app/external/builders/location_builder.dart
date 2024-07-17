import 'package:tractian_challenge/app/data/builders/item_builder.dart';
import 'package:tractian_challenge/app/data/models/item_model.dart';
import 'package:tractian_challenge/app/data/models/location_model.dart';

class LocationBuilder extends ItemBuilder {
  @override
  ItemModel build(Map<String, dynamic> map) {
    return LocationModel.fromMap(map);
  }
}
