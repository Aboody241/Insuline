// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/username/username_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';

class MorningUser extends StatelessWidget {
  const MorningUser({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<UsernameCubit>().state ?? "Null";

    return Row(
      children: [
        Text(
          "Good morning, ",
          style: InsulinBoldFonts.largeBoldFont,
        ),
        Text(
          "$userName",
          style: InsulinBoldFonts.largeBoldFont.copyWith(
            color: KprimaryC
          ),
        ),
      ],
    );
  }
}
