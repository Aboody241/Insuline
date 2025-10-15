import 'package:flutter/material.dart';
import 'package:insulin95/features/activities/widgets/activities_item.dart';
import 'package:insulin95/data/models/activities_model.dart';

class ActivitiesItemScroll extends StatelessWidget {
  const ActivitiesItemScroll({super.key, required this.activities});

  final List<ActivitiesModel> activities;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return ActivitiesItem(activity: activity);
        },
      ),
    );
  }
}
