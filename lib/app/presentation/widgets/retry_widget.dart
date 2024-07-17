import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';
import 'package:tractian_challenge/core/utils/failure.dart';

class RetryWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;
  const RetryWidget({
    required this.failure,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(failure.message, style: context.text.bodyMedium),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: context.text.bodyMedium?.copyWith(
                color: context.scheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
