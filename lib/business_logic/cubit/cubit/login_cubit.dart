import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_screen/componants/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData passSuffix = Icons.remove_red_eye;
  bool isInvisible = true;
  void changePasswordVisibility() {
    isInvisible = !isInvisible;
    passSuffix = isInvisible ? Icons.remove_red_eye : Icons.password;

    emit(PasswordVisibilityChangeState());
  }

  void userSignIn({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId = value.user!.uid;
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
