import 'package:tractian_challenge/app/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/domain/usecases/fetch_companies_usecase.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/state.dart';

class CompanyController {
  final FetchCompaniesUsecase _fetchCompanies;

  CompanyController({required FetchCompaniesUsecase fetchCompaniesUsecase})
      : _fetchCompanies = fetchCompaniesUsecase;

  final _companiesState = ReactiveState<Failure, List<CompanyEntity>>();

  Future<void> fetchCompanies() async {
    _companiesState.changeToLoadingState();

    final result = await _fetchCompanies();
    result.when(
      success: (data) => _companiesState.changeToSuccessState(data),
      failure: (error) => _companiesState.changeToErrorState(error),
    );
  }
}
