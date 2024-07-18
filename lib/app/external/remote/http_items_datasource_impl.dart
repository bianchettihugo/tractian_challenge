import 'dart:convert';

import 'package:tractian_challenge/app/data/builders/item_builder.dart';
import 'package:tractian_challenge/app/data/datasources/remote_items_datasource.dart';
import 'package:tractian_challenge/app/data/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:tractian_challenge/core/values/links.dart';
import 'package:tractian_challenge/core/values/strings.dart';

/// Implementation of [RemoteItemsDatasource] using the http package
class HttpItemsDatasourceImpl extends RemoteItemsDatasource {
  /// With an abstract builder, we can change the way items are
  /// build specifying a concrete builder implementation
  ItemBuilder _itemBuilder;

  HttpItemsDatasourceImpl({required ItemBuilder itemBuilder})
      : _itemBuilder = itemBuilder;

  @override
  Stream<ItemModel> fetchItems({
    required String endpoint,
    required String companyId,
  }) async* {
    final data = await http.get(
      Uri.parse('${Links.baseUrl}/companies/$companyId/$endpoint'),
    );

    final result = jsonDecode(data.body);

    if (result is List) {
      for (var element in result) {
        yield _itemBuilder.build(element);
      }
    } else {
      throw Exception(Strings.companiesDatasourceError);
    }
  }

  @override
  void setItemBuilder(ItemBuilder itemBuilder) {
    _itemBuilder = itemBuilder;
  }
}
