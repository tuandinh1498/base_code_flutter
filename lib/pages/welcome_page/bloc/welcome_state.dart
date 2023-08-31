part of 'welcome_bloc.dart';

 class WelcomeState extends Equatable{
   int page;
   WelcomeState({this.page=0});

  @override
  List<Object?> get props => [page];

}

