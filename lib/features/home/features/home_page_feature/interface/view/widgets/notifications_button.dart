
import 'package:flutter/material.dart';
import 'package:insulin95/features/home/features/notifications/interface/view/notification_view.dart';
import 'package:page_transition/page_transition.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: NotificationView(),
          ),
        );
      },
      icon: Icon(Icons.notifications_none_rounded, size: 30),
    );
  }
}
