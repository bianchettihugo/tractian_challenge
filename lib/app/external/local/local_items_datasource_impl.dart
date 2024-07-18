import 'package:tractian_challenge/app/data/datasources/local_items_datasource.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

class LocalItemsDatasourceImpl extends LocalItemsDatasource {
  final List<ItemEntity> _items = [];
  final Map<String, ItemEntity> _itemsDatabase = {};
  final Map<String, List<ItemEntity>> _itemsByParentId = {};
  String _cachedCompanyId = '';

  @override
  List<ItemEntity> getItems() {
    return _items;
  }

  @override
  void addItem(ItemEntity item) {
    if (_itemsByParentId.containsKey(item.id)) {
      item.children?.addAll(_itemsByParentId[item.id]!);
    }

    if (item.parentId == null) {
      _items.add(item);
      _itemsDatabase[item.id] = item;
      return;
    }

    if (_itemsDatabase.containsKey(item.parentId)) {
      _itemsDatabase[item.parentId]!.children?.add(item);
    } else {
      _itemsByParentId.putIfAbsent(item.parentId!, () => []).add(item);
    }

    _itemsDatabase[item.id] = item;
  }

  @override
  void clearItems() {
    _itemsDatabase.clear();
    _itemsByParentId.clear();
    _items.clear();
  }

  @override
  String? get cachedCompanyId => _cachedCompanyId;

  @override
  void setCachedCompanyId(String companyId) {
    _cachedCompanyId = companyId;
  }
}
