// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic_farm/features/authentication/bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../constants/app_validator.dart';
import '../data/data_repository/data_repository_implementation.dart';
import '../internal_services/services/supabase/supabase_auth_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(super.empty) {
    on<ChangeEmailEvent>(_onEmailChanged);
    on<ChangePasswordEvent>(_onPasswordChanged);
    on<SignupEvent>(_signUp);
    on<GoogleAuth>(_googleSignIn);

  }
  _onEmailChanged(
    ChangeEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(isEmailValid: AppValidators.isValidEmail(event.email)));
  }

  _onPasswordChanged(
    ChangePasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(
        isPasswordValid: AppValidators.isValidPassword(event.password)));
  }

  Future<void> _signUp(
    SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final dataImplementation = DataImplementation();
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(seconds: 5));
    final userModel = await dataImplementation.createAnAccount(
        email: event.email, password: event.password);
    emit(state.copyWith(isSuccess: true));
    print(userModel.toString());
  }


  Future<void> _googleSignIn(
    GoogleAuth event,
    Emitter<AuthenticationState> emit,
  ) async {
    final signInWithGitHub = await  SupabaseAuthService().supabaseAuthService(Supabase.instance);
    signInWithGitHub.signInWithGitHub();
    await Future.delayed(const Duration(seconds: 5));

    // final userModel = await googleService.googleSignInService();
    // print(userModel.toString());
  }
}
