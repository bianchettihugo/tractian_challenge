import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_items_by_company_id_usecase.dart';
import 'package:tractian_challenge/app/domain/usecases/filter_items_by_name_usecase.dart';
import 'package:tractian_challenge/app/domain/usecases/filter_items_by_property_usecase.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/state.dart';

class ItemsController {
  final FetchItemsByCompanyIdUsecase _fetchItemsByCompanyId;
  final FilterItemsByNameUsecase _filterItemsByName;
  final FilterItemsByPropertyUsecase _filterItemsByProperty;

  ItemsController(
      {required FetchItemsByCompanyIdUsecase fetchItemsByCompanyIdUsecase,
      required FilterItemsByNameUsecase filterItemsByNameUsecase,
      required FilterItemsByPropertyUsecase filterItemsByPropertyUsecase})
      : _fetchItemsByCompanyId = fetchItemsByCompanyIdUsecase,
        _filterItemsByName = filterItemsByNameUsecase,
        _filterItemsByProperty = filterItemsByPropertyUsecase;

  final itemsState = ReactiveState<Failure, List<ItemEntity>>();
  final selectedFilter = ValueNotifier<String>('');
  String companyId = '';

  Future<void> fetchItems(String companyId) async {
    this.companyId = companyId;
    selectedFilter.value = '';
    itemsState.changeToLoadingState();

    final result = await _fetchItemsByCompanyId(companyId);
    result.when(
      success: (data) => itemsState.changeToSuccessState(data),
      failure: (error) => itemsState.changeToErrorState(error),
    );
  }

  Future<void> searchItems(String query) async {
    if (itemsState.isLoading) return;
    itemsState.changeToLoadingState();
    if (query.isEmpty) {
      fetchItems(companyId);
      return;
    }

    final result = await _filterItemsByName(query: query);
    result.when(
      success: (data) => itemsState.changeToSuccessState(data),
      failure: (error) => itemsState.changeToErrorState(error),
    );
  }

  Future<void> searchProperty(String property) async {
    if (itemsState.isLoading) return;
    selectedFilter.value = property;
    itemsState.changeToLoadingState();
    if (property.isEmpty) {
      fetchItems(companyId);
      return;
    }

    final result = await _filterItemsByProperty(property: property);
    result.when(
      success: (data) => itemsState.changeToSuccessState(data),
      failure: (error) => itemsState.changeToErrorState(error),
    );
  }
}
