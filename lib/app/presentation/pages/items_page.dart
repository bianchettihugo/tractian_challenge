import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/controllers/item_controller.dart';
import 'package:tractian_challenge/app/presentation/widgets/reactive_state_widget.dart';
import 'package:tractian_challenge/app/presentation/widgets/retry_widget.dart';
import 'package:tractian_challenge/app/presentation/widgets/selector_widget.dart';
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
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.controller.fetchItems(widget.companyId);
    });
  }

  void _onSearchChanged(String text) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 600), () {
      widget.controller.searchItems(text);
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
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
      body: GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                  fillColor: context.scheme.surfaceContainer,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: widget.controller.selectedFilter,
              builder: (context, filter, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(children: [
                    SelectorWidget(
                      icon: Icons.bolt_outlined,
                      label: 'Energy Sensor',
                      selected: filter == 'energy',
                      onPressed: (label) {
                        if (filter == 'energy') {
                          widget.controller.searchProperty('');
                        }
                        widget.controller.searchProperty('energy');
                      },
                    ),
                    const SizedBox(width: 10),
                    SelectorWidget(
                      icon: Icons.error_outline_rounded,
                      label: 'Critical',
                      selected: filter == 'alert',
                      onPressed: (label) {
                        if (filter == 'alert') {
                          widget.controller.searchProperty('');
                        }

                        widget.controller.searchProperty('alert');
                      },
                    ),
                  ]),
                );
              },
            ),
            const Divider(),
            ReactiveStateWidget(
              listenable: widget.controller.itemsState,
              onLoading: () => const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
              onError: (error) => Expanded(
                child: RetryWidget(
                  failure: error,
                  onRetry: () {
                    widget.controller.fetchItems(widget.companyId);
                  },
                ),
              ),
              onSuccess: (data) {
                if (data.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text('No items found',
                          style: context.text.bodyMedium),
                    ),
                  );
                }
                return Expanded(child: TreeView(items: data));
              },
            ),
          ],
        ),
      ),
    );
  }
}
