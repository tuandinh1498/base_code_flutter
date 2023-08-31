import 'package:dio_cache_flutter_test/data/model/get_city_vn_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/get_city_vn_usecase.dart';

import '../../../core/api/core_api.dart';

class GetCityVnImpl implements GetCityVn {
  final _customDio = CustomDio();
  Map<String, String> param() {
    return {
      "country_id": "vn"
    };
  }

  @override
  Future<GetCityVnModel> getCityVn() async {
    final respond = await _customDio.get("api/v2/directory/regions", parameters: param());
    return GetCityVnModel.fromJson(respond.data);
  }

}