import 'package:equatable/equatable.dart';

class UserModel extends Equatable
{
  final String? id;
  final String? name;
  final String? email;
  final String? avatar;
  final String? phoneNumber;

  const UserModel({this.id, this.name, this.email, this.avatar, this.phoneNumber});

  @override

  List<Object?> get props => [id,name,email,avatar,phoneNumber];

  @override
  String toString() {
    return 'UserData{name: $name}';
  }


}