import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());

  final ImagePicker _picker = ImagePicker();

  /// رفع صورة جديدة
  Future<void> pickAndUploadImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      File file = File(pickedFile.path);

      emit(ProfileImageUploading());

      // ✅ نخزن الصورة باسم uid في Firebase Storage
      final user = FirebaseAuth.instance.currentUser;
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user!.uid}.jpg');

      await ref.putFile(file);

      // ✅ نجيب الرابط
      final url = await ref.getDownloadURL();

      emit(ProfileImageUploaded(url));
    } catch (e) {
      emit(ProfileImageError(e.toString()));
    }
  }

  /// جلب صورة المستخدم المحفوظة مسبقًا
  Future<void> loadUserProfileImage() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user.uid}.jpg');

      final url = await ref.getDownloadURL();

      emit(ProfileImageUploaded(url));
    } catch (e) {
      // لو مفيش صورة
      emit(ProfileImageInitial());
    }
  }
}
