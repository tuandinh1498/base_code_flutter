import 'package:dio_cache_flutter_test/data/model/get_city_vn_model.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/get_city_vn_usecase.dart';
import 'package:dio_cache_flutter_test/data/repositories/usecase_repo/get_wards_usecase.dart';

import '../../../core/api/core_api.dart';
import '../usecase_repo/get_distric_usecase.dart';

class GetWardsVnImpl implements GetWardsUseCase {
  final _customDio = CustomDio();
  Map<String, String> param(num? districtId) {
    return {
      "district_id": "$districtId"
    };
  }

  @override
  Future<GetCityVnModel> getWardsVn({num? districtId}) async {
    final respond = await _customDio.get("api/v2/directory/wards", parameters: param(districtId));
    return GetCityVnModel.fromJson(respond.data);
  }

}