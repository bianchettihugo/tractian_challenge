import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/entities/component_entity.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class ComponentItem extends StatelessWidget {
  final ComponentEntity component;
  ComponentItem({
    required this.component,
    super.key,
  });

  final _sensorTypeIcons = {
    'energy': Icons.bolt,
  };

  final _statusIcons = {
    'alert': Icons.circle,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.grid_view,
          color: context.scheme.primary,
          size: 32,
        ),
        const SizedBox(width: 10),
        Text(
          component.name,
          overflow: TextOverflow.ellipsis,
          style: context.text.bodyMedium?.copyWith(
            color: context.scheme.onSurface,
          ),
        ),
        const SizedBox(width: 5),
        if (_statusIcons[component.status ?? ''] != null)
          Icon(
            _statusIcons[component.status] ?? Icons.circle,
            color: context.scheme.error,
            size: 8,
          ),
        const SizedBox(width: 3),
        if (_sensorTypeIcons[component.sensorType ?? ''] != null)
          Icon(
            _sensorTypeIcons[component.sensorType] ?? Icons.circle,
            color: context.scheme.tertiary,
            size: 21,
          ),
      ],
    );
  }
}
