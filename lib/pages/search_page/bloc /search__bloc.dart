import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_cache_flutter_test/data/repositories/impl_repo/search_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/model/search_model.dart';

part 'search__event.dart';
part 'search__state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchSubmit>(_onSearchSubmit);
  }
  final _searchImpl = SearchImpl();
  Future<void> _onSearchSubmit(
    SearchSubmit event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: SearchStatus.initial,products: []));
      try {
        final searchProducts = await _searchProducts(event.searchValue);
        emit(state.copyWith(
            status: SearchStatus.success, products: searchProducts.products));
      } catch (_) {
        emit(state.copyWith(status: SearchStatus.failure));
      }
    }


  Future<SearchModel> _searchProducts(String? search) async {
    return _searchImpl.getProducts(search);
  }
}
