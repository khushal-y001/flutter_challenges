import 'package:organic_farm/features/authentication/internal_services/services/supabase/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository(
    this._supabaseAuthService,
  );
  final SupabaseAuthService _supabaseAuthService;

  Future<AuthResponse> supabaseSignUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final authService = await _supabaseAuthService.supabaseAuthService(Supabase.instance);
    return authService.signInWithEmailAndPassword(email: email, password: password);
  }
}
