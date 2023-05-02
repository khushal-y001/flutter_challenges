import '../../models/user_model.dart';
import 'base_services.dart';

class GoogleService implements BaseServices {
  @override
  Future<UserModel> googleSignInService() async {
    Future.delayed(const Duration(seconds: 2));
    return UserModel(
      name: "Khushal yadav",
      email: "Khushalyadav90@gmail.com",
      avatar: "",
      id: "1234",
      phoneNumber: "",
    );
  }
  @override
  Future<void> appleSignInService() async {}
  @override
  Future<void> awsSignInService() async {}
  @override
  Future<void> facebookSignInService() async {}
}
