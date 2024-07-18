import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/presentation/factories/item_factory.dart';
import 'package:tractian_challenge/app/presentation/factories/item_factory_provider.dart';
import 'package:tractian_challenge/app/presentation/widgets/tree_view/tree_item.dart';
import 'package:tractian_challenge/core/utils/dependency.dart';

class TreeView extends StatefulWidget {
  final List<ItemEntity> items;
  const TreeView({required this.items, super.key});

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  Widget build(BuildContext context) {
    return ItemFactoryProvider(
      itemFactory: Dependency.get<ItemFactory>(),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 10,
            child: ListView.builder(
              itemCount: widget.items.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TreeItem(
                  key: ValueKey(
                    '${widget.items[index].id}-${widget.items[index].isExpanded}-',
                  ),
                  item: widget.items[index],
                  itemFactory: ItemFactoryProvider.of(context).itemFactory,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
