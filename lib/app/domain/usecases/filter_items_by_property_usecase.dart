import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/item_repository.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class FilterItemsByPropertyUsecase {
  Future<Result<List<ItemEntity>>> call({
    required String property,
  });
}

class FilterItemsByPropertyUsecaseImpl implements FilterItemsByPropertyUsecase {
  final ItemRepository _itemRepository;

  FilterItemsByPropertyUsecaseImpl({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  @override
  Future<Result<List<ItemEntity>>> call({
    required String property,
  }) async {
    return _itemRepository.filterItemsByProperty(property: property);
  }
}
