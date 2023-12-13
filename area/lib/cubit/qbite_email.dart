import 'package:bloc/bloc.dart';

class EmailCubit extends Cubit<String> {
  EmailCubit() : super('');

  void updateEmail(String email) {
    emit(email);
  }
}