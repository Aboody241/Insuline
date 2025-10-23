import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/home_page_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    // تحميل النتيجة المحفوظة عند بدء الصفحة
    context.read<BmiCubit>().loadSavedBmi();
  }

  @override
  Widget build(BuildContext context) {
    return const HomePageBody();
  }
}