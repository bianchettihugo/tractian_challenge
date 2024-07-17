import 'dart:convert';

import 'package:tractian_challenge/app/data/datasources/remote_company_datasource.dart';
import 'package:tractian_challenge/app/data/models/company_model.dart';
import 'package:http/http.dart' as http;
import 'package:tractian_challenge/core/values/links.dart';
import 'package:tractian_challenge/core/values/strings.dart';

/// Implementation of [RemoteCompanyDatasource] using the http package
class HttpCompanyDatasourceImpl extends RemoteCompanyDatasource {
  @override
  Future<List<CompanyModel>> fetchCompanies() async {
    final data = await http.get(
      Uri.parse('${Links.baseUrl}/companies'),
    );
    final result = jsonDecode(data.body);

    if (result is List) {
      return result.map((e) => CompanyModel.fromMap(e)).toList();
    } else {
      throw Exception(Strings.companiesDatasourceError);
    }
  }
}
