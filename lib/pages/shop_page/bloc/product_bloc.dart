import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio_cache_flutter_test/data/model/products_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/impl_repo/get_product_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'product_event.dart';
part 'product_state.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<FetchProduct>(_onProductFetched,
    transformer: throttleDroppable(throttleDuration));
  }
  final _getProducts=GetProductsImpl();

  Future<void> _onProductFetched(
      FetchProduct event,
      Emitter<ProductState> emit,
      ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ProductStatus.initial) {
        final products = await _fetchProducts();
        return emit(
          state.copyWith(
            status: ProductStatus.success,
            products: products.products,
            hasReachedMax: false,
          ),
        );
      }
      final products = await _fetchProducts(state.products.length);
      products.products!.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
        state.copyWith(
          status: ProductStatus.success,
          products: List.of(state.products)..addAll(products.products!),
          hasReachedMax: false,
        ),
      );
    } catch (_) {

      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<ProductsModel> _fetchProducts([int startIndex = 0]) async {
    return _getProducts.getProducts(startIndex);
  }
}

