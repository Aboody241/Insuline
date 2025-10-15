// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/features/activities/activities_page.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/home_page_view.dart';
import 'package:insulin95/features/profile/profile_view.dart';
import 'package:insulin95/features/recipes/recipes_view.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePageView(),
    const RecipesView(),
    const ActivitiesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تقدر تحط BasicAppBar هنا لو عايزp
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: WaterDropNavBar(
        bottomPadding: 25,
        inactiveIconColor: KtherdC,
        waterDropColor: KprimaryC,
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
            filledIcon: Icons.fastfood,
            outlinedIcon: Icons.fastfood_outlined,
          ),
          BarItem(
            filledIcon: Icons.sports_gymnastics_rounded,
            outlinedIcon: Icons.sports_gymnastics_rounded,
          ),
          BarItem(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_2_outlined,
          ),
        ],
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
