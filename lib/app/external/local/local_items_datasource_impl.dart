import 'package:tractian_challenge/app/data/datasources/local_items_datasource.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

class LocalItemsDatasourceImpl extends LocalItemsDatasource {
  final List<ItemEntity> _items = [];
  final Map<String, dynamic> _itemsDatabase = {};

  @override
  List<ItemEntity> getItems() {
    return _items;
  }

  @override
  void addItem(ItemEntity item) {
    if (_itemsDatabase.containsKey(item.parentId)) {
      _itemsDatabase[item.parentId].add(item);
    }

    _itemsDatabase[item.id] = item;
  }

  @override
  void clearItems() {
    _itemsDatabase.clear();
    _items.clear();
  }
}
