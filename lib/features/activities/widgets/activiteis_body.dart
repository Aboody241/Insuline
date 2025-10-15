import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/activities/widgets/activities_listview.dart';
import 'package:insulin95/features/recipes/widgets/search_bar_recipes.dart';
import 'package:insulin95/data/models/activities_model.dart';

class ActiviteisBody extends StatelessWidget {
  final List<ActivitiesModel> activities;

  const ActiviteisBody({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Activities",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomSearchBar(
              backGroundColor: KfourC,
              iconColor: KtherdC,
              hint: "Search Activities",
            ),
            VerticalSpace(2).of(context),
            ActivitiesItemScroll(activities: activities),
          ],
        ),
      ),
    );
  }
}
