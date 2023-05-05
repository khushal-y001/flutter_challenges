import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthenticationType {
  SupabaseAuthenticationType(this._supabase) : assert(_supabase != null);
  final Supabase _supabase;

  Future<AuthResponse> signUpWithEmailAndPassword({required String email,required String password}) async {
      final AuthResponse authResponse = await _supabase.client.auth.signUp(
        email: email,
        password: password
    );
    return authResponse;
  }
  Future<void> signInWithEmailAndPassword({required String email,required String password}) async {
      final AuthResponse authResponse = await _supabase.client.auth.signInWithPassword(
        email: email,
        password: password
    );
  }
  Future<void> signInWithGitHub() async {
    final user = await _supabase.client.auth.signInWithOAuth(Provider.github);
    print(user);
  }

  Future<void> signInWithGoogle() async {}
  Future<void> signInWithFacebook() async {}
}
