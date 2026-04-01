import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/data/Repository/recipes/recipes_cashes.dart';
import 'package:insulin95/features/recipes/favorate_recipes/favorate_recipes_voew.dart';
import 'package:insulin95/features/recipes/widgets/categories_items.dart';
import 'package:insulin95/features/recipes/widgets/recipes_items.dart';
import 'package:insulin95/features/recipes/widgets/search_bar_recipes.dart';

class RecipesBody extends StatefulWidget {
  const RecipesBody({super.key});

  @override
  State<RecipesBody> createState() => _RecipesBodyState();
}

class _RecipesBodyState extends State<RecipesBody> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Recipes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavorateRecipesVeiw()),
              );
            },
            icon: const Icon(
              Icons.favorite_sharp,
              size: 30,
              color: Colors.redAccent,
            ),
          ),
          HorizentalSpace(2).of(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            VerticalSpace(1).of(context),
            const CustomSearchBar(
              backGroundColor: KwhiteGreen,
              iconColor: Colors.green,
              hint: "Search Recipes...",
            ),
            VerticalSpace(1.5).of(context),
            FutureBuilder(
              future: RecipesCache().getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                return CustomCategoriesItems(
                  categories: snapshot.data!,
                  color: Colors.grey[200]!,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
              },
            ),
            VerticalSpace(1.5).of(context),
            Expanded(
              child: RecipesItems(
                category: selectedCategory,
                controller: ScrollController(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
