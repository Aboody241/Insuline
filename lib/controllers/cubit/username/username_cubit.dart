// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<String?> {
  UsernameCubit() : super(null);

  void setUsername(String username) {
    emit(username);
  }
}

