// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import '../../../constants/app_validator.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(super.empty) {
    on<ChangeEmailEvent>((event, emit) {
      emit(state.cloneWith(
        isEmailValid: AppValidators.isValidEmail(event.email)
      ));
    });
    on<ChangePasswordEvent>((event, emit) {
      emit(state.cloneWith(
          isPasswordValid: AppValidators.isValidEmail(event.password)
      ));
    });
  }
}
