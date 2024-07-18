import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class ItemRepository {
  Future<Result<List<ItemEntity>>> fetchItems(String companyId);

  Future<Result<List<ItemEntity>>> filterItemsByName({
    required String query,
  });

  Future<Result<List<ItemEntity>>> filterItemsByProperty({
    required String property,
  });
}
