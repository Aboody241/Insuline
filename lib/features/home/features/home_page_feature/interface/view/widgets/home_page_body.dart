import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/appBar_title.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/feature_title.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/morning_user.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/sections/home_indicators.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/sections/quick_access_buttons.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/sections/reminder_widegts.dart';
import 'package:insulin95/features/home/features/notifications/interface/view/notification_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        // leading: Icon(Icons.add),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Insuline 95",
                  style: InsulinNormalFonts.meduimNormalFont.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationView(),
                      ),
                    );
                  },
                  icon: Icon(Icons.notifications_none_rounded, size: 30),
                ),
              ],
            ),
            const MorningUser(),
            VerticalSpace(1).of(context),
          ],
        ),
        surfaceTintColor: const Color(0xffFFFFFF),
        backgroundColor: const Color(0xffFFFFFF),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                VerticalSpace(3).of(context),

                const HomeIndicators(),

                VerticalSpace(3).of(context),

                const FeaturesTitle(featureTitle: 'Medication Reminders'),

                VerticalSpace(0.5).of(context),

                const ReminderWidgets(),

                VerticalSpace(2.1).of(context),

                const FeaturesTitle(featureTitle: "Quick Access"),

                VerticalSpace(1.5).of(context),

                const QuickAccessButtons(),

                VerticalSpace(2).of(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
