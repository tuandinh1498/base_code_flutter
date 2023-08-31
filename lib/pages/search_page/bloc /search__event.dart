part of 'search__bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class SearchSubmit extends SearchEvent{
  final String searchValue;
  const SearchSubmit({required this.searchValue});
}