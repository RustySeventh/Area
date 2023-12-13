import 'package:bloc/bloc.dart';

class PasswordCubit extends Cubit<String> {
  PasswordCubit() : super('');

  void updatePassword(String password) {
    emit(password);
  }
}