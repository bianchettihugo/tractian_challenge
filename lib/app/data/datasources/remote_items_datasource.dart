import 'package:tractian_challenge/app/data/builders/item_builder.dart';
import 'package:tractian_challenge/app/data/models/item_model.dart';

abstract class RemoteItemsDatasource {
  /// Fetch items from different endpoints
  Stream<ItemModel> fetchItems({
    required String endpoint,
    required String companyId,
  });

  void setItemBuilder(
    ItemBuilder itemBuilder,
  );
}
