class RecipesModel {
  final int id;
  final String name;
  final String category;
  final String image;
  final String instructions;
  final String area;

  
  RecipesModel({
    required this.name,
    required this.category,
    required this.image,
    required this.instructions,
    required this.id, required this.area,
  });


  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      instructions: json['instructions'] as String,
      area: json['area'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'instructions': instructions,
      'area': area,
    };
  }
}
