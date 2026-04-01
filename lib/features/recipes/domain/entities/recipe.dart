/// Recipe entity
/// Pure business object representing a recipe in the domain layer
class Recipe {
  final int id;
  final String name;
  final String category;
  final String imageUrl;
  final String instructions;
  final String area;
  final bool isFavorite;

  const Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.instructions,
    required this.area,
    this.isFavorite = false,
  });

  /// Creates a copy of this Recipe with updated values
  Recipe copyWith({
    int? id,
    String? name,
    String? category,
    String? imageUrl,
    String? instructions,
    String? area,
    bool? isFavorite,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      instructions: instructions ?? this.instructions,
      area: area ?? this.area,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Recipe && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, category: $category, area: $area)';
  }
}
