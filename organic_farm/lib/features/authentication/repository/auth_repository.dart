import 'package:organic_farm/features/authentication/internal_services/repository/supabase_repository/supabase_authentication_repository.dart';
import 'package:organic_farm/features/authentication/internal_services/services/supabase/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  static AuthRepository init(
      {required SupabaseAuthenticationRepository supabaseAuthenticationRepository}) {
    return AuthRepository._(supabaseAuthenticationRepository);
  }

  AuthRepository._(this.supabaseAuthenticationRepository);
  final SupabaseAuthenticationRepository supabaseAuthenticationRepository;

  SupabaseAuthService get supabaseAuthService =>
      SupabaseAuthService.init(supabaseAuthenticationRepository: supabaseAuthenticationRepository);

  Future<AuthResponse> supabaseSignUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await supabaseAuthenticationRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<bool> supabaseSignInWithGitHub() async {
    return await supabaseAuthenticationRepository.signInWithGitHub();
  }
}
