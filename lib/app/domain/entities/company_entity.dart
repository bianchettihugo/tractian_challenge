/// Represents a company.
class CompanyEntity {
  final String id;
  final String name;

  CompanyEntity({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(covariant CompanyEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
