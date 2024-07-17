import 'package:tractian_challenge/app/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/domain/repositories/company_repository.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class FetchCompaniesUsecase {
  Future<Result<List<CompanyEntity>>> call();
}

class FetchCompaniesUsecaseImpl implements FetchCompaniesUsecase {
  final CompanyRepository _companyRepository;

  FetchCompaniesUsecaseImpl({
    required CompanyRepository companyRepository,
  }) : _companyRepository = companyRepository;

  @override
  Future<Result<List<CompanyEntity>>> call() async {
    return _companyRepository.fetchCompanies();
  }
}
