import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthenticationType {
  SupabaseAuthenticationType(this._supabase) : assert(_supabase != null);

  final Supabase _supabase;
  Future<void> signUpWithEmail() async {
    final AuthResponse res = await _supabase.client.auth.signInWithPassword(
        email: 'example@email.com',
        password: 'example-password'
    );
  }
  Future<void> signInWithGitHub() async {
    final user = await _supabase.client.auth.signInWithOAuth(Provider.github);
    print(user);
  }

  Future<void> signInWithGitHubGoogle() async {}
  Future<void> signInWithGitHubFacebook() async {}
}
