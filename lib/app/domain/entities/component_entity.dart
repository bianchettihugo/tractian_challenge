import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

/// Represents a component within the item tree.
/// Since components have no children this class sets children to null.
class ComponentEntity extends ItemEntity {
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;

  ComponentEntity({
    required this.sensorId,
    required this.sensorType,
    required this.status,
    required this.gatewayId,
    required super.id,
    required super.name,
    super.parentId,
  }) : super(children: null);

  @override
  containsProperty(String property) {
    return sensorType == property || status == property;
  }
}
