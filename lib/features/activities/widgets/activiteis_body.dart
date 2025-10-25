import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/activities/widgets/activity_dash.dart';
import 'package:insulin95/features/activities/widgets/rec_exercises.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/feature_title.dart';
import 'package:insulin95/data/models/activities_model.dart';

class ActiviteisBody extends StatelessWidget {
  final List<ActivitiesModel> activities;

  const ActiviteisBody({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text(
          "Activities",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // -------- البطاقة العلوية + عنوان "Recommended Exercises" --------
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  ActivityDash(),
                  VerticalSpace(3).of(context),
                  FeaturesTitle(featureTitle: "Recommended Exercises"),
                  VerticalSpace(1).of(context),
                ],
              ),
            ),
          ),

          // -------- ليست أفقية (كويسة تبقى SliverToBoxAdapter مع ارتفاع ثابت) --------
          SliverToBoxAdapter(child: RecExercises()),

          // -------- عنوان "Today's Plan" كـ SliverToBoxAdapter --------
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  VerticalSpace(3).of(context),
                  FeaturesTitle(featureTitle: "Today's Plan"),
                  VerticalSpace(1).of(context),
                ],
              ),
            ),
          ),

          // -------- البنود العمودية كـ SliverList (بدلاً من ListView داخل Column) --------
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList.separated(
              itemCount: 4,
              separatorBuilder: (_, __) => VerticalSpace(1.2).of(context),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: KOffwhiteC,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    title: Text(
                      "Morning Walking",
                      style: InsulinBoldFonts.meduimBoldFont18,
                    ),
                    subtitle: Text(
                      "30 minutes",
                      style: InsulinNormalFonts.smallFont14.copyWith(
                        color: KtherdC,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // TODO: toggle done state
                      },
                      icon: const Icon(Icons.check_box_outline_blank, size: 25),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
