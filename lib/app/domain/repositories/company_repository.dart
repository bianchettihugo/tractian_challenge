import 'package:tractian_challenge/app/domain/entities/company_entity.dart';
import 'package:tractian_challenge/core/utils/result.dart';

abstract class CompanyRepository {
  Future<Result<List<CompanyEntity>>> fetchCompanies();
}
