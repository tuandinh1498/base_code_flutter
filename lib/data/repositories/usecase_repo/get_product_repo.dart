import '../../model/products_model.dart';

abstract class GetProduct{
  Future<ProductsModel> getProducts();
}