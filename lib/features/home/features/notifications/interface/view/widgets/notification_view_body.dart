import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "Notifications"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: KsecondaryC,
                    ),
                    child: Icon(Icons.notifications_none_rounded, size: 30),
                  ),
                  title: Text(
                    "High Blood Sugar",
                    style: TextFontStyle.meduimFont.copyWith(fontSize: 16),
                  ),
                  subtitle: Text(
                    "Your blood sugar level is high. Consider taking a corrective dose.",
                    maxLines: 2,
                    
                    overflow: TextOverflow.ellipsis,
                    style: TextFontStyleSecColor.smallFont.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5
                    ),
                  ),
                  trailing: Text(
                    "4h ago",
                    style: TextFontStyleSecColor.smallFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15
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
