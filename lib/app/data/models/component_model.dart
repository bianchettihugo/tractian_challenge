import 'package:tractian_challenge/app/data/models/item_model.dart';
import 'package:tractian_challenge/app/domain/entities/component_entity.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';

class ComponentModel extends ItemModel {
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;

  ComponentModel({
    required super.id,
    required super.name,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    super.parentId,
    super.locationId,
  });

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      sensorId: map['sensorId'],
      sensorType: map['sensorType'],
      status: map['status'],
      gatewayId: map['gatewayId'],
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
      locationId: map['locationId'],
    );
  }

  @override
  ItemEntity toEntity() {
    return ComponentEntity(
      id: id,
      name: name,
      sensorId: sensorId,
      sensorType: sensorType,
      status: status,
      gatewayId: gatewayId,
      parentId: locationId ?? parentId,
    );
  }
}
