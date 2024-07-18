/// Represents each item within the item tree, encapsulating their shared attributes.
/// This parent class enhances the tree's flexibility, facilitating the addition
/// of new item types.
class ItemEntity {
  final String id;
  final String name;
  final String? parentId;
  final List<ItemEntity>? children;
  bool isExpanded;

  ItemEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.children,
    this.isExpanded = false,
  });

  bool containsName(String name) {
    if (children == null) {
      final result = this.name.toLowerCase().contains(name.toLowerCase());
      isExpanded = result;
      return result;
    } else {
      final result = children!.any((element) => element.containsName(name)) ||
          this.name.toLowerCase().contains(name.toLowerCase());
      isExpanded = result;
      return result;
    }
  }

  bool containsProperty(String property) {
    final result =
        children?.any((element) => element.containsProperty(property)) ?? false;
    isExpanded = result;
    return result;
  }
}
