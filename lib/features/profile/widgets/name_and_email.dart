import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/username/username_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<UsernameCubit>().state ?? "null";

    return Column(
      children: [
        Text(userName, style: InsulinBoldFonts.largeBoldFont),
        VerticalSpace(1).of(context),

        Text(
          "Insuline-95@gmail.com",
          style: InsulinNormalFonts.meduimNormalFont.copyWith(
            fontSize: 16,
            color: KPurble,
          ),
        ),
      ],
    );
  }
}
