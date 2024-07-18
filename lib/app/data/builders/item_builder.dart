import 'package:tractian_challenge/app/data/models/item_model.dart';

/// Interface that must be implemented by builders which build items
/// depending on specific rules.
abstract class ItemBuilder {
  ItemModel build(Map<String, dynamic> map);
}
