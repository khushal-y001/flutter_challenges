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
    on<OnChangeEmailEvent>(_onEmailChanged);
    on<OnChangePasswordEvent>(_onPasswordChanged);
    on<SignupEvent>(_signUp);
    on<GoogleAuth>(_googleSignIn);

  }
  _onEmailChanged(
      OnChangeEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(isEmailValid: AppValidators.isValidEmail(event.email)));
  }

  _onPasswordChanged(
      OnChangePasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(
        isPasswordValid: AppValidators.isValidPassword(event.password)));
  }

  Future<void> _signUp(
    SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));
    final signUp = await SupabaseAuthService().supabaseAuthService(Supabase.instance);
    final authResponse = await signUp.signUpWithEmailAndPassword(email:event.email,password: event.password);
    print("User Session refreshToken ${authResponse.session!.refreshToken}");
    print("User data ${authResponse.user!.email}");
    emit(state.copyWith(isSuccess: true));
  }


  Future<void> _googleSignIn(
    GoogleAuth event,
    Emitter<AuthenticationState> emit,
  ) async {
    final signInWithGitHub = await  SupabaseAuthService().supabaseAuthService(Supabase.instance);
    signInWithGitHub.signInWithGitHub();
    // final userModel = await googleService.googleSignInService();
    // print(userModel.toString());
  }
}
