part of 'search__bloc.dart';
enum SearchStatus{initial,success,failure}
class SearchState extends Equatable {
  final SearchStatus status;
  final List<Products> products;

  const SearchState({
    this.status = SearchStatus.initial,
    this.products = const <Products>[],

  });

  SearchState copyWith({
    SearchStatus? status,
    List<Products>? products,
    bool? hasReachedMax,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,

    );
  }

  @override
  List<Object?> get props => [status, products];
}