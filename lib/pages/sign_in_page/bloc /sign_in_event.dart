part of 'sign_in_bloc.dart';

abstract class SignInEvent  {
  const SignInEvent();
}

class LoginEvent extends SignInEvent{
  final String email;
  final String password;
  const LoginEvent({required this.email,required this.password});
}
