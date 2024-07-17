import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class CompanyButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const CompanyButton({
    required this.label,
    required this.onPressed,
    this.icon = Icons.apartment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: context.theme.primaryColor,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: context.scheme.onPrimary,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: context.text.bodyMedium?.copyWith(
              color: context.scheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
