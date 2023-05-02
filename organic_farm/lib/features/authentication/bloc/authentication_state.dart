import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
class AuthenticationState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? message;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const AuthenticationState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    this.message,
  });

  factory AuthenticationState.empty() {
    return const AuthenticationState(
      isEmailValid: false,
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  factory AuthenticationState.logging() {
    return const AuthenticationState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: "");
  }

  factory AuthenticationState.failure(String message) {
    return  AuthenticationState(
      isEmailValid: true,
      isPasswordValid: true,
      isSuccess: false,
      isSubmitting: false,
      isFailure: true,
      message: message,
    );
  }

  factory AuthenticationState.success() {
    return const AuthenticationState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      message: "",
    );
  }

  AuthenticationState update({bool? isEmailValid, bool? isPasswordValid}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  AuthenticationState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
  }) {
    return AuthenticationState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
  @override
  String toString() {
    return 'LoginState{isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
  @override
  List<Object?> get props => [isEmailValid,isPasswordValid,isSubmitting,isSuccess,isFailure,message];
}