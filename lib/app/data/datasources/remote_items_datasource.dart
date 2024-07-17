import 'package:tractian_challenge/app/data/models/item_model.dart';

abstract class RemoteItemsDatasource {
  Stream<ItemModel> fetchItems({required String endpoint});
}
