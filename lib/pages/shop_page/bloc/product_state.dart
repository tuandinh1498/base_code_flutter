part of 'product_bloc.dart';

enum ProductStatus { initial, success, failure }

class ProductState extends Equatable{
  final ProductStatus status;
  final List<Products> products;
  final bool hasReachedMax;

  const ProductState({
      this.status = ProductStatus.initial,
      this.products = const <Products>[],
      this.hasReachedMax = false
  });

  ProductState copyWith({
     ProductStatus? status,
     List<Products>? products,
     bool? hasReachedMax,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>[status,products,hasReachedMax];


}
