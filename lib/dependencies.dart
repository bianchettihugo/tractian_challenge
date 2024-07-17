import 'package:tractian_challenge/app/data/datasources/remote_company_datasource.dart';
import 'package:tractian_challenge/app/data/repositories/company_repository_impl.dart';
import 'package:tractian_challenge/app/domain/repositories/company_repository.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_companies_usecase.dart';
import 'package:tractian_challenge/app/external/remote/http_company_datasource_impl.dart';
import 'package:tractian_challenge/app/presentation/controllers/company_controller.dart';
import 'package:tractian_challenge/core/utils/dependency.dart';

class Dependencies {
  static void register() {
    _registerCompanyDependencies();
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
}
