import 'package:organic_farm/features/authentication/models/user_model.dart';

import 'data_repository.dart';

class DataImplementation implements DataService
{
  @override
  Future<UserModel> createAnAccount({required String email,required String password}) async{
    Future.delayed(const Duration(seconds: 2));
    return UserModel(
      name: "Khushal yadav",
      email: "Khushalyadav90@gmail.com",
      avatar: "",
      id: "1234",
      phoneNumber: "",
    );
  }

}