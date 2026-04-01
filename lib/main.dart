import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insulin95/controllers/cubit/username/username_cubit.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/data/models/medication_model.dart';
import 'package:insulin95/data/models/bmi_result_model.dart';
import 'package:insulin95/features/navigation/navbar/nav_Bar.dart';
import 'package:insulin95/features/splash/interface/Splash/Splash_view.dart';
import 'package:insulin95/firebase_options.dart';
import 'package:insulin95/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  Hive.registerAdapter(MedicationAdapter());

  Hive.registerAdapter(BmiResultAdapter());

  // Initialize service locator
  await init();

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
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(fontFamily: 'Lexend'),
          bodyMedium: TextStyle(fontFamily: 'Lexend'),
          bodySmall: TextStyle(fontFamily: 'Lexend'),
          labelLarge: TextStyle(fontFamily: 'Lexend'),
          labelMedium: TextStyle(fontFamily: 'Lexend'),
          labelSmall: TextStyle(fontFamily: 'Lexend'),
        ),
        scaffoldBackgroundColor: KwhiteC,
      ),
      home: const NavBar(),
    );
  }
}
