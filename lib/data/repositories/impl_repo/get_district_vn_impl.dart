import 'package:dio_cache_flutter_test/data/model/get_city_vn_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/get_city_vn_usecase.dart';

import '../../../core/api/core_api.dart';
import '../usecase_repo/get_distric_usecase.dart';

class GetDistrictVnImpl implements GetDistrictVn {
  final _customDio = CustomDio();
  Map<String, String> param(num? ciyId) {
    return {
      "region_id": "$ciyId"
    };
  }

  @override
  Future<GetCityVnModel> getDistrictVn({num? cityId}) async {
    final respond = await _customDio.get("api/v2/directory/districts", parameters: param(cityId));
    return GetCityVnModel.fromJson(respond.data);
  }

}