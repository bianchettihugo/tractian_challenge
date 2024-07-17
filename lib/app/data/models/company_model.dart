import 'package:tractian_challenge/app/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({required super.id, required super.name});

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
