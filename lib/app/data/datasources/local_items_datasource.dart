import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

abstract class LocalItemsDatasource {
  List<ItemEntity> getItems();

  void addItem(ItemEntity item);

  void clearItems();

  String? get cachedCompanyId;

  void setCachedCompanyId(String companyId);
}
