part of 'sign_in_bloc.dart';

enum SignInStatus{init,success,loading,failure}
class SignInState extends Equatable{
  final String? token;
  final String message;
  final SignInStatus signInStatus;
   SignInState({this.token="",this.message="",required this.signInStatus});

  SignInState copyWith({
     String? token,
     String? message,
     SignInStatus? signInStatus
  }) {
    return SignInState(
      token: token ?? this.token,
      message: message ?? this.message,
      signInStatus: signInStatus?? this.signInStatus,
    );
  }
  @override
  List<Object?> get props => [token,message];
}


