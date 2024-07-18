import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/entities/item_entity.dart';
import 'package:tractian_challenge/app/presentation/factories/item_factory.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class TreeItem extends StatefulWidget {
  final ItemEntity item;
  final int treeLevel;
  final ItemFactory itemFactory;

  const TreeItem(
      {super.key,
      required this.item,
      required this.itemFactory,
      this.treeLevel = 1});

  @override
  State<TreeItem> createState() => _TreeItemState();
}

class _TreeItemState extends State<TreeItem> {
  late bool expanded;

  @override
  void initState() {
    expanded = widget.item.isExpanded;
    super.initState();
  }

  bool get _hasChildren =>
      widget.item.children != null && widget.item.children!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                if (_hasChildren)
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: context.scheme.onSurface,
                  ),
                if (!_hasChildren) const SizedBox(width: 24),
                widget.itemFactory.build(context: context, item: widget.item),
              ],
            ),
          ),
        ),
        if (_hasChildren && expanded)
          Padding(
            padding: EdgeInsets.only(
                left: widget.treeLevel == 1 ? 20 : 10.0 * widget.treeLevel),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.item.children!
                  .map((e) => TreeItem(
                        item: e,
                        key: ValueKey('${e.id}-${e.isExpanded}'),
                        treeLevel: widget.treeLevel + 1,
                        itemFactory: widget.itemFactory,
                      ))
                  .toList(),
            ),
          )
      ],
    );
  }
}
