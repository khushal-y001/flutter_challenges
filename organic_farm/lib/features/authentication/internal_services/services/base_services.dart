import '../../models/user_model.dart';

abstract class BaseServices {
  Future<UserModel> googleSignInService();

  Future<void> appleSignInService();

  Future<void> facebookSignInService();

  Future<void> awsSignInService();
}
