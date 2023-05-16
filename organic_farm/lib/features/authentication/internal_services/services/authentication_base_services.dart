import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseServices {
  Future<void> firebaseAuthService();
  Future<void> awsAuthService();
  Future supabaseAuthService(Supabase supabase);
}
