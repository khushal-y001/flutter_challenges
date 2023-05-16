import 'package:organic_farm/features/authentication/internal_services/repository/supabase_repository/supabase_authentication_repository.dart';
import 'package:organic_farm/features/authentication/internal_services/services/authentication_base_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService implements BaseServices {
  @override
  Future<void> awsAuthService() async {}

  @override
  Future<void> firebaseAuthService() async {}

  @override
  Future<SupabaseAuthenticationRepository> supabaseAuthService(Supabase supabase) async {
    return SupabaseAuthenticationRepository(supabase);
  }
}
