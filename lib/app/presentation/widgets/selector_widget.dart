import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class SelectorWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final void Function(String) onPressed;
  const SelectorWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      onPressed: () => onPressed(label),
      elevation: 0,
      fillColor: selected ? context.scheme.primary : context.scheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: !selected
            ? BorderSide(
                color: context.scheme.surfaceContainer,
                width: 1,
              )
            : BorderSide.none,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? context.scheme.onPrimary : context.scheme.outline,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: context.text.bodyMedium?.copyWith(
              color:
                  selected ? context.scheme.onPrimary : context.scheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
