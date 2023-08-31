import '../../model/get_city_vn_model.dart';

abstract class GetDistrictVn{
  Future<GetCityVnModel> getDistrictVn({num? cityId});
}