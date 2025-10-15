import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insulin95/features/recipes/widgets/recipes_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipesItems extends StatefulWidget {
  final String category;
  final ScrollController controller;

  const RecipesItems({
    super.key,
    required this.category,
    required this.controller,
  });

  @override
  State<RecipesItems> createState() => _RecipesItemsState();
}

class _RecipesItemsState extends State<RecipesItems> {
  List meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  @override
  void didUpdateWidget(covariant RecipesItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      fetchMeals();
    }
  }

  Future<void> fetchMeals() async {
    setState(() {
      isLoading = true;
      meals = [];
    });

    try {
      String url;
      if (widget.category == "All") {
        url = "https://www.themealdb.com/api/json/v1/1/search.php?s=";
      } else {
        url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category}";
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          meals = data["meals"] ?? [];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(milliseconds: 1200),
      ),
      child: RecipesCard(
        isLoading: isLoading,
        meals: meals,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
      ),
    );
  }
}
