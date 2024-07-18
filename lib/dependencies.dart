import 'package:tractian_challenge/app/data/datasources/local_items_datasource.dart';
import 'package:tractian_challenge/app/data/datasources/remote_company_datasource.dart';
import 'package:tractian_challenge/app/data/datasources/remote_items_datasource.dart';
import 'package:tractian_challenge/app/data/repositories/company_repository_impl.dart';
import 'package:tractian_challenge/app/data/repositories/item_repository_impl.dart';
import 'package:tractian_challenge/app/domain/repositories/company_repository.dart';
import 'package:tractian_challenge/app/domain/repositories/item_repository.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_companies_usecase.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_items_by_company_id_usecase.dart';
import 'package:tractian_challenge/app/external/builders/asset_builder.dart';
import 'package:tractian_challenge/app/external/builders/location_builder.dart';
import 'package:tractian_challenge/app/external/local/local_items_datasource_impl.dart';
import 'package:tractian_challenge/app/external/remote/http_company_datasource_impl.dart';
import 'package:tractian_challenge/app/external/remote/http_items_datasource_impl.dart';
import 'package:tractian_challenge/app/presentation/controllers/company_controller.dart';
import 'package:tractian_challenge/app/presentation/controllers/item_controller.dart';
import 'package:tractian_challenge/core/utils/dependency.dart';

class Dependencies {
  static void register() {
    _registerCompanyDependencies();
    _registerItemsDependencies();
  }

  static void _registerCompanyDependencies() {
    Dependency.register<RemoteCompanyDatasource>(HttpCompanyDatasourceImpl());

    Dependency.register<CompanyRepository>(CompanyRepositoryImpl(
      remoteCompanyDatasource: Dependency.get<RemoteCompanyDatasource>(),
    ));

    Dependency.register<FetchCompaniesUsecase>(FetchCompaniesUsecaseImpl(
      companyRepository: Dependency.get<CompanyRepository>(),
    ));

    Dependency.register<CompanyController>(
      CompanyController(
        fetchCompaniesUsecase: Dependency.get<FetchCompaniesUsecase>(),
      ),
    );
  }

  static void _registerItemsDependencies() {
    Dependency.register<LocationBuilder>(LocationBuilder());
    Dependency.register<AssetBuilder>(AssetBuilder());

    Dependency.register<RemoteItemsDatasource>(HttpItemsDatasourceImpl(
      itemBuilder: Dependency.get<LocationBuilder>(),
    ));
    Dependency.register<LocalItemsDatasource>(LocalItemsDatasourceImpl());

    Dependency.register<ItemRepository>(
      ItemRepositoryImpl(
        remoteItemsDatasource: Dependency.get<RemoteItemsDatasource>(),
        localItemsDatasource: Dependency.get<LocalItemsDatasource>(),
        locationBuilder: Dependency.get<LocationBuilder>(),
        assetBuilder: Dependency.get<AssetBuilder>(),
      ),
    );

    Dependency.register<FetchItemsByCompanyIdUsecase>(
      FetchItemsByCompanyIdUsecaseImpl(
        itemRepository: Dependency.get<ItemRepository>(),
      ),
    );

    Dependency.register<ItemsController>(
      ItemsController(
        fetchItemsByCompanyIdUsecase:
            Dependency.get<FetchItemsByCompanyIdUsecase>(),
      ),
    );
  }
}
