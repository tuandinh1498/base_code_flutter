import '../../model/get_city_vn_model.dart';

abstract class GetWardsUseCase{
  Future<GetCityVnModel> getWardsVn({num? districtId});
}