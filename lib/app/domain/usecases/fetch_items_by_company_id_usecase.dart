import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/item_repository.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class FetchItemsByCompanyIdUsecase {
  Future<Result<List<ItemEntity>>> call(String companyId);
}

class FetchItemsByCompanyIdUsecaseImpl implements FetchItemsByCompanyIdUsecase {
  final ItemRepository _itemRepository;

  FetchItemsByCompanyIdUsecaseImpl({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  @override
  Future<Result<List<ItemEntity>>> call(String companyId) async {
    return _itemRepository.fetchItems(companyId);
  }
}
