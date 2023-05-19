import 'package:organic_farm/features/authentication/internal_services/repository/supabase_repository/supabase_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  static SupabaseAuthService init(
      {required SupabaseAuthenticationRepository supabaseAuthenticationRepository}) {
    return SupabaseAuthService._(supabaseAuthenticationRepository);
  }

  SupabaseAuthService._(this.supabaseAuthenticationRepository);

  final SupabaseAuthenticationRepository supabaseAuthenticationRepository;

  Future<AuthResponse> authenticationWithSupabase(
      {required String email, required String password}) async {
    return await supabaseAuthenticationRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
