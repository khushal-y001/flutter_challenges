import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic_farm/constants/app_validator.dart';
import 'package:organic_farm/features/authentication/bloc/bloc.dart';
import 'package:organic_farm/features/authentication/internal_services/services/supabase/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(super.empty) {
    on<OnChangeEmailEvent>(_onEmailChanged);
    on<OnChangePasswordEvent>(_onPasswordChanged);
    on<SignupEvent>(_signUp);
    on<GithubAuth>(_signInWithGithub);
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
    emit(state.copyWith(isPasswordValid: AppValidators.isValidPassword(event.password)));
  }

  Future<void> _signUp(
    SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(state.copyWith(isSubmitting: true));
      final signUp = await SupabaseAuthService().supabaseAuthService(Supabase.instance);
      final authResponse =
          await signUp.signUpWithEmailAndPassword(email: event.email, password: event.password);
      if (authResponse.session == null) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(isSuccess: true));
      }
    } catch (e) {
      emit(state.copyWith(isSubmitting: false));
    }
  }

  Future<void> _signInWithGithub(
    GithubAuth event,
    Emitter<AuthenticationState> emit,
  ) async {
    final signInWithGitHub = await SupabaseAuthService().supabaseAuthService(Supabase.instance);
    signInWithGitHub.signInWithGitHub();
  }
}
