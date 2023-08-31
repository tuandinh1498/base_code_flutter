import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/impl_repo/sign_in_impl.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState(signInStatus: SignInStatus.init)) {
    on<LoginEvent>(_signInEvent);
  }

  final _signInImpl = SignInImpl();
  Future<void> _signInEvent(LoginEvent event, Emitter<SignInState> emit) async {
    emit(SignInState(signInStatus: SignInStatus.loading));
    try {
      var signIn = await _signInImpl.signIn(
          email: event.email, password: event.password);
      emit(
          SignInState(signInStatus: SignInStatus.success, token: signIn.token));
    } catch (e) {
      emit(SignInState(
          signInStatus: SignInStatus.failure, message: "wrong pass or email"));
    }
  }
}
