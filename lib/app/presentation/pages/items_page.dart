import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/controllers/item_controller.dart';
import 'package:tractian_challenge/app/presentation/widgets/reactive_state_widget.dart';
import 'package:tractian_challenge/app/presentation/widgets/retry_widget.dart';
import 'package:tractian_challenge/app/presentation/widgets/tree_view/tree_view.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class ItemsPage extends StatefulWidget {
  final String companyId;
  final ItemsController controller;

  const ItemsPage({
    required this.companyId,
    required this.controller,
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.controller.fetchItems(widget.companyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.scheme.secondary,
        title: Text(
          'Assets',
          style: context.text.bodyMedium?.copyWith(
            color: context.scheme.onSecondary,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: context.scheme.onSecondary,
            size: 32,
          ),
        ),
      ),
      body: ReactiveStateWidget(
        listenable: widget.controller.itemsState,
        onLoading: () => const Center(child: CircularProgressIndicator()),
        onError: (error) => RetryWidget(
          failure: error,
          onRetry: () {
            widget.controller.fetchItems(widget.companyId);
          },
        ),
        onSuccess: (data) {
          return TreeView(items: data);
        },
      ),
    );
  }
}
