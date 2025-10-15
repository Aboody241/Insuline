import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insulin95/controllers/cubit/username/username_cubit.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/data/models/medication_model.dart';
import 'package:insulin95/features/User%20Welcome/welocomePage.dart';
import 'package:insulin95/features/navigation/navbar/nav_Bar.dart';
import 'package:insulin95/features/splash/interface/Splash/Splash_view.dart';
import 'package:insulin95/features/splash/interface/widgets/splash_view_body.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter(MedicationAdapter());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit()),
        BlocProvider(create: (context) => BmiCubit()),
      ],
      child: const Insulin95(),
    ),
  );
}

class Insulin95 extends StatelessWidget {
  const Insulin95({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insulin95',
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
        scaffoldBackgroundColor: KwhiteC,
      ),
      home: const SplashViewBody(),
    );
  }
}
