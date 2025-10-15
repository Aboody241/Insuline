import 'package:flutter/material.dart';
import 'package:insulin95/features/activities/widgets/activiteis_body.dart';
import 'package:insulin95/data/models/activities_model.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      ActivitiesModel(
        title: "Morning Run",
        time: "30 minutes Daily",
        image: "assets/test_images/activit.png",
      ),
      ActivitiesModel(
        title: "Morning Run",
        time: "30 minutes Daily",
        image: "assets/test_images/activit.png",
      ),
      ActivitiesModel(
        title: "Morning Run",
        time: "30 minutes Daily",
        image: "assets/test_images/activit.png",
      ),
      ActivitiesModel(
        title: "Morning Run",
        time: "5:00 PM",
        image: "assets/test_images/activit.png",
      ),
      ActivitiesModel(
        title: "Morning Run",
        time: "5:00 PM",
        image: "assets/test_images/activit.png",
      ),
      ActivitiesModel(
        title: "Morning Run",
        time: "5:00 PM",
        image: "assets/test_images/activit.png",
      ),
    ];

    return ActiviteisBody(activities: activities);
  }
}
