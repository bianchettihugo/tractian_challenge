import 'package:tractian_challenge/app/data/datasources/remote_company_datasource.dart';
import 'package:tractian_challenge/app/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/company_repository.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/result.dart';
import 'package:tractian_challenge/core/values/strings.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final RemoteCompanyDatasource _remoteCompanyDatasource;

  CompanyRepositoryImpl(
      {required RemoteCompanyDatasource remoteCompanyDatasource})
      : _remoteCompanyDatasource = remoteCompanyDatasource;

  @override
  Future<Result<List<CompanyEntity>>> fetchCompanies() async {
    try {
      final result = await _remoteCompanyDatasource.fetchCompanies();
      return Result.success(result);
    } catch (e) {
      return Result.failure(
        const Failure(
          message: Strings.companiesDatasourceError,
        ),
      );
    }
  }
}
