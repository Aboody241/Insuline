import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  
  final Color backGroundColor;
  final Color iconColor;
  final String hint;

  
  const CustomSearchBar({super.key, required this.backGroundColor, required this.iconColor, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backGroundColor,
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: iconColor,
              size: 25,
            ),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
