import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}
class SignupEvent extends AuthenticationEvent {}
class GoogleAuth extends AuthenticationEvent {}
class FaceBookAuth extends AuthenticationEvent {}
class AppleAuth extends AuthenticationEvent {}
class LogoutEvent extends AuthenticationEvent {}
class ChangeEmailEvent extends AuthenticationEvent {
  final String email;

 const ChangeEmailEvent({required this.email});
  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}
class ChangePasswordEvent extends AuthenticationEvent {
  final String password;

  const ChangePasswordEvent({required this.password});
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
  }
}
