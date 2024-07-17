import 'package:tractian_challenge/app/data/models/company_model.dart';

abstract class RemoteCompanyDatasource {
  Future<List<CompanyModel>> fetchCompanies();
}
