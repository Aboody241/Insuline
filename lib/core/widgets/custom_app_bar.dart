import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final  Widget title;
  final Widget? leading;
  final double? elevation;
  final List<Widget> actions;

  const BasicAppBar({
    super.key,
    required this.title,
    this.leading,
    this.elevation,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      leading: leading,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: title,
      surfaceTintColor: const Color(0xffFFFFFF),
      backgroundColor: const Color(0xffFFFFFF),
      actions: actions,
    );
  }

  // علشان AppBar لازم يكون له height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//===============================================================
//===============================================================

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: KwhiteC,
      backgroundColor: KwhiteC,
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: KblackC,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: OnBoardStyle.onBoardTitle, // نفس ستايلك
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CenterBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CenterBackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      surfaceTintColor: KwhiteC,
      backgroundColor: KwhiteC,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: KblackC),
      ),
      title: Text(
        title,
        style: OnBoardStyle.onBoardTitle.copyWith(fontSize: 20), // نفس ستايلك
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
