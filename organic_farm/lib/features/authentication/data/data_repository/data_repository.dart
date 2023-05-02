import '../../models/user_model.dart';

abstract class DataService
{
  Future<UserModel> createAnAccount({required String email,required String password});
}