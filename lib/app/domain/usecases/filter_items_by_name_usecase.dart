import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/item_repository.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class FilterItemsByNameUsecase {
  Future<Result<List<ItemEntity>>> call({
    required String query,
  });
}

class FilterItemsByNameUsecaseImpl implements FilterItemsByNameUsecase {
  final ItemRepository _itemRepository;

  FilterItemsByNameUsecaseImpl({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  @override
  Future<Result<List<ItemEntity>>> call({
    required String query,
  }) async {
    return _itemRepository.filterItemsByName(query: query);
  }
}
