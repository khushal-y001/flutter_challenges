import 'package:organic_farm/features/authentication/internal_services/services/supabase/supabase_authentication_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../authentication_base_services.dart';

class SupabaseAuthService implements BaseServices
{
  @override
  Future<void> awsAuthService()async {

  }

  @override
  Future<void> firebaseAuthService()async {

  }

  @override
  Future<SupabaseAuthenticationType> supabaseAuthService(Supabase supabase)async {
    return SupabaseAuthenticationType(supabase);
  }

}