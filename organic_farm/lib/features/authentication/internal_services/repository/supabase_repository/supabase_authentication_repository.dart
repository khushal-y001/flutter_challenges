import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthenticationRepository {
  SupabaseAuthenticationRepository(this._supabase);
  final Supabase _supabase;

  Future<AuthResponse> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _supabase.client.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _supabase.client.auth.signInWithPassword(email: email, password: password);
  }

  Future<bool> signInWithGitHub() async {
    return await _supabase.client.auth.signInWithOAuth(Provider.github);
  }

  Future<void> signInWithGoogle() async {}
  Future<void> signInWithFacebook() async {}
}
