import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insulin95/controllers/cubit/username/username_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/User%20Welcome/welocomePage.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/feature_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPhotoBody extends StatefulWidget {
  const UserPhotoBody({super.key});

  @override
  State<UserPhotoBody> createState() => _UserPhotoBodyState();
}

class _UserPhotoBodyState extends State<UserPhotoBody> {
  final TextEditingController firstName = TextEditingController();
  File? _imageFile;

  // ...

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // ✅ خزن المسار
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "Your Profile"),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  VerticalSpace(3).of(context),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : AssetImage("assets/icons/default_profile.jpg")
                                  as ImageProvider,
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: KwhiteC,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit, size: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(2.5).of(context),

                  Text(
                    "Upload Your Photo",
                    style: InsulinBoldFonts.largeBoldFont,
                  ),
                  VerticalSpace(1.1).of(context),
                  Text(
                    "This photo will be visible to other users",
                    style: TextFontStyleSecColor.smallFont,
                  ),
                  VerticalSpace(2).of(context),

                  FeaturesTitle(featureTitle: "First Name"),
                  BasicEmptyFormField(controller: firstName),
                  VerticalSpace(1).of(context),

                  FeaturesTitle(featureTitle: "Second Name"),
                  const BasicEmptyFormField(),
                  VerticalSpace(15).of(context),

                  CustomButton1(
                    color: KprimaryC,
                    title: "Submit",
                    titleColor: KwhiteC,
                    ontap: () {
                      final name = firstName.text.trim();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );

                      if (name.isNotEmpty) {
                        context.read<UsernameCubit>().setUsername(name);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
