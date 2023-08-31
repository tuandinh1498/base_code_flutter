part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class TouchButton extends WelcomeEvent{
  int page;
  TouchButton({required this.page});

  @override
  List<Object?> get props => [page];
}
