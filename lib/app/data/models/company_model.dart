import 'package:tractian_challenge/app/domain/entities/company_entity.dart';

class CompanyModel {
  final String id;
  final String name;

  CompanyModel({
    required this.id,
    required this.name,
  });

  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id,
      name: name,
    );
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
