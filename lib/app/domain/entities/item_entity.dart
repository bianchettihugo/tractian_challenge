/// Represents each item within the item tree, encapsulating their shared attributes.
/// This parent class enhances the tree's flexibility, facilitating the addition
/// of new item types.
class ItemEntity {
  final String id;
  final String name;
  final String? parentId;
  final List<ItemEntity>? children;

  ItemEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.children,
  });
}
