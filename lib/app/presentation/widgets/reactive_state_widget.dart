import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/utils/failure.dart';
import 'package:tractian_challenge/core/utils/state.dart';

class ReactiveStateWidget<T> extends StatelessWidget {
  final ReactiveState<Failure, T> listenable;
  final Widget Function(T) onSuccess;
  final Widget Function() onLoading;
  final Widget Function(Failure) onError;

  const ReactiveStateWidget({
    super.key,
    required this.listenable,
    required this.onSuccess,
    required this.onLoading,
    required this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PageState<Failure, T>>(
      valueListenable: listenable,
      builder: (context, state, child) {
        if (listenable.isSuccess) {
          return onSuccess(listenable.data);
        } else if (listenable.isError) {
          return onError(listenable.error);
        }
        return onLoading();
      },
    );
  }
}
