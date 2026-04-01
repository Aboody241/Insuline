import '../../domain/entities/recipe.dart';

/// Recipe model
/// Data transfer object for API responses and local storage
class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.name,
    required super.category,
    required super.imageUrl,
    required super.instructions,
    required super.area,
    super.isFavorite = false,
  });

  /// Create RecipeModel from JSON
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['idMeal'] as int? ?? json['id'] as int? ?? 0,
      name: json['strMeal'] as String? ?? json['name'] as String? ?? '',
      category: json['strCategory'] as String? ?? json['category'] as String? ?? '',
      imageUrl: json['strMealThumb'] as String? ?? json['image'] as String? ?? json['imageUrl'] as String? ?? '',
      instructions: json['strInstructions'] as String? ?? json['instructions'] as String? ?? '',
      area: json['strArea'] as String? ?? json['area'] as String? ?? '',
    );
  }

  /// Create RecipeModel from domain entity
  factory RecipeModel.fromEntity(Recipe entity) {
    return RecipeModel(
      id: entity.id,
      name: entity.name,
      category: entity.category,
      imageUrl: entity.imageUrl,
      instructions: entity.instructions,
      area: entity.area,
      isFavorite: entity.isFavorite,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': imageUrl,
      'imageUrl': imageUrl,
      'instructions': instructions,
      'area': area,
      'isFavorite': isFavorite,
    };
  }

  /// Convert to domain entity
  Recipe toEntity() {
    return Recipe(
      id: id,
      name: name,
      category: category,
      imageUrl: imageUrl,
      instructions: instructions,
      area: area,
      isFavorite: isFavorite,
    );
  }
}
