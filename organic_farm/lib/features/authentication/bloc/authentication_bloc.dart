import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic_farm/constants/app_validator.dart';
import 'package:organic_farm/features/authentication/bloc/bloc.dart';
import 'package:organic_farm/features/authentication/internal_services/repository/supabase_repository/supabase_authentication_repository.dart';
import 'package:organic_farm/features/authentication/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(super.empty) {
    on<OnChangeEmailEvent>(_onEmailChanged);
    on<OnChangePasswordEvent>(_onPasswordChanged);
    on<SignupEvent>(_signUp);
    on<GithubAuth>(_signInWithGithub);
  }
  final SupabaseAuthenticationRepository supabaseAuthenticationRepository =
      SupabaseAuthenticationRepository(Supabase.instance);

  AuthRepository get authRepository =>
      AuthRepository.init(supabaseAuthenticationRepository: supabaseAuthenticationRepository);

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
      final authResponse = await authRepository.supabaseSignUpWithEmailAndPassword(
          email: event.email, password: event.password);
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
    final authResponse = await authRepository.supabaseSignInWithGitHub();
  }
}
