import 'package:flutter/material.dart';

class CustomCategoriesItems extends StatefulWidget {
  final List<String> categories;
  final Color color;
  final Function(String) onCategorySelected;

  const CustomCategoriesItems({
    super.key,
    required this.categories,
    required this.color,
    required this.onCategorySelected,
  });

  @override
  State<CustomCategoriesItems> createState() => _CustomCategoriesItemsState();
}

class _CustomCategoriesItemsState extends State<CustomCategoriesItems> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
              widget.onCategorySelected(category);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : widget.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
