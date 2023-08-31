import 'package:dio_cache_flutter_test/data/model/products_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/get_product_repo.dart';

import '../../../core/api/core_api.dart';

const productLimit = 10;

class GetProductsImpl implements GetProduct {
  final _customDio = CustomDio();
  Map<String, String> param([int startIndex = 0]) {
    return {
      "limit": "$productLimit",
      "skip": "$startIndex",
      "select": "title,price",

    };
  }

  @override
  Future<ProductsModel> getProducts([int startIndex = 0]) async {
    final respond = await _customDio.get("products", parameters: param(startIndex));
    print(respond.statusCode);
    return ProductsModel.fromJson(respond.data);
  }
}
