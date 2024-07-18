import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_items_by_company_id_usecase.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/state.dart';

class ItemController {
  final FetchItemsByCompanyIdUsecase _fetchItemsByCompanyId;

  ItemController(
      {required FetchItemsByCompanyIdUsecase fetchItemsByCompanyIdUsecase})
      : _fetchItemsByCompanyId = fetchItemsByCompanyIdUsecase;

  final itemsState = ReactiveState<Failure, List<ItemEntity>>();

  Future<void> fetchItems(String companyId) async {
    itemsState.changeToLoadingState();

    final result = await _fetchItemsByCompanyId(companyId);
    result.when(
      success: (data) => itemsState.changeToSuccessState(data),
      failure: (error) => itemsState.changeToErrorState(error),
    );
  }
}
