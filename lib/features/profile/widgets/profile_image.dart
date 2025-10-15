import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  /// تحميل الصورة من SharedPreferences
  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image');
    if (path != null) {
      setState(() {
        _imageFile = File(path);
      });
    }
  }

  /// اختيار صورة من مصدر محدد (كاميرا / معرض)
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _imageFile = file;
      });

      // ✅ تخزين المسار
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedFile.path);
    }
  }

  /// فتح BottomSheet لاختيار المصدر
  void _showPickOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// صورة البروفايل
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: _imageFile != null
                ? Image.file(_imageFile!, fit: BoxFit.cover)
                : Image.asset(
                    "assets/icons/default_profile.jpg",
                    fit: BoxFit.cover,
                  ),
          ),
        ),

        /// زر التعديل (يفتح الـ BottomSheet)
        Positioned(
          bottom: 0,
          right: 7,
          child: GestureDetector(
            onTap: () => _showPickOptions(context),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.white),
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              width: 35,
              height: 35,
              child: const Icon(Icons.edit, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
