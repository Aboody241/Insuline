import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';

class RecipesCard extends StatelessWidget {
  final bool isLoading;
  final List meals;
  final double screenWidth;
  final double screenHeight;

  const RecipesCard({
    super.key,
    required this.isLoading,
    required this.meals,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: isLoading ? 8 : meals.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth < 600
            ? 2
            : screenWidth < 900
                ? 3
                : 4,
        childAspectRatio: 0.70,
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final meal = isLoading
            ? {"strMealThumb": "", "strMeal": "Loading..."}
            : meals[index];

        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: isLoading
                      ? Container(
                          height: screenHeight * 0.22,
                          color: Colors.grey[300],
                        )
                      : Image.network(
                          meal["strMealThumb"],
                          height: screenHeight * 0.22,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    meal["strMeal"],
                    style: InsulinNormalFonts.meduimNormalFont.copyWith(
                      fontSize: screenWidth * 0.04,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Opacity(
                opacity: .6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
