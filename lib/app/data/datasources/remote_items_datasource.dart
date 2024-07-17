import 'package:tractian_challenge/app/data/models/item_model.dart';

abstract class RemoteItemsDatasource {
  /// Fetch items from different endpoints
  Stream<ItemModel> fetchItems({required String endpoint});
}
