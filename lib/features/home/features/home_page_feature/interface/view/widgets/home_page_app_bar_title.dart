
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';

class HomePageAppBarTitle extends StatelessWidget {
  const HomePageAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Insuline 95", style: TextFontStyle.meduimFont)],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_rounded, size: 30),
        ),
      ],
    );
  }
}

