import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/images.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/splash/interface/on%20board/interface/view/on_board_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 9/3,
              child: Image.asset(
                LogosImages.blueRectangleLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
