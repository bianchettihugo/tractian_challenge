import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/factories/item_factory.dart';

class ItemFactoryProvider extends InheritedWidget {
  const ItemFactoryProvider({
    super.key,
    required this.itemFactory,
    required super.child,
  });

  final ItemFactory itemFactory;

  static ItemFactoryProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ItemFactoryProvider>();
  }

  static ItemFactoryProvider of(BuildContext context) {
    final ItemFactoryProvider? result = maybeOf(context);
    assert(result != null, 'No ItemFactory found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ItemFactoryProvider oldWidget) =>
      itemFactory != oldWidget.itemFactory;
}
