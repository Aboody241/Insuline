part of 'profile_image_cubit.dart';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageUploading extends ProfileImageState {}

class ProfileImageUploaded extends ProfileImageState {
  final String imageUrl;
  ProfileImageUploaded(this.imageUrl);
}

class ProfileImageError extends ProfileImageState {
  final String message;
  ProfileImageError(this.message);
}
