import 'package:tractian_challenge/app/data/datasources/local_items_datasource.dart';
import 'package:tractian_challenge/app/data/datasources/remote_items_datasource.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/item_repository.dart';
import 'package:tractian_challenge/app/external/builders/asset_builder.dart';
import 'package:tractian_challenge/app/external/builders/location_builder.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/result.dart';
import 'package:tractian_challenge/core/values/strings.dart';

class ItemRepositoryImpl extends ItemRepository {
  final RemoteItemsDatasource _remoteItemsDatasource;
  final LocalItemsDatasource _localItemsDatasource;
  final LocationBuilder _locationBuilder;
  final AssetBuilder _assetBuilder;

  ItemRepositoryImpl({
    required RemoteItemsDatasource remoteItemsDatasource,
    required LocalItemsDatasource localItemsDatasource,
    required LocationBuilder locationBuilder,
    required AssetBuilder assetBuilder,
  })  : _remoteItemsDatasource = remoteItemsDatasource,
        _localItemsDatasource = localItemsDatasource,
        _locationBuilder = locationBuilder,
        _assetBuilder = assetBuilder;

  @override
  Future<Result<List<ItemEntity>>> fetchItems(String companyId) async {
    try {
      if (_localItemsDatasource.cachedCompanyId == companyId) {
        return Result.success(_localItemsDatasource.getItems());
      }

      _localItemsDatasource.clearItems();

      _remoteItemsDatasource.setItemBuilder(_locationBuilder);
      final locations = _remoteItemsDatasource.fetchItems(
        endpoint: 'locations',
        companyId: companyId,
      );

      await for (final item in locations) {
        _localItemsDatasource.addItem(item.toEntity());
      }

      _remoteItemsDatasource.setItemBuilder(_assetBuilder);
      final assets = _remoteItemsDatasource.fetchItems(
        endpoint: 'assets',
        companyId: companyId,
      );

      await for (final item in assets) {
        _localItemsDatasource.addItem(item.toEntity());
      }

      _localItemsDatasource.setCachedCompanyId(companyId);
      return Result.success(_localItemsDatasource.getItems());
    } catch (e) {
      return Result.failure(
        const Failure(
          message: Strings.companiesDatasourceError,
        ),
      );
    }
  }
}
