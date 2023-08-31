import 'package:dio_cache_flutter_test/data/model/search_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/search_usecase.dart';

import '../../../core/api/core_api.dart';

class SearchImpl implements SearchUseCase {
  final _customDio = CustomDio();
  Map<String, String> param(String? search) {
    return {
      "q": "$search"
    };
  }


  @override
  Future<SearchModel> getProducts(String? search) async{
    final respond = await _customDio.get("products/search", parameters: param(search));
    return SearchModel.fromJson(respond.data);
  }
}