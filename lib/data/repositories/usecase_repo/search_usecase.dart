import 'package:dio_cache_flutter_test/data/model/search_model.dart';

abstract class SearchUseCase{
  Future<SearchModel> getProducts(String? search);
}