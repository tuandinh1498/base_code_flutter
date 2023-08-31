part of 'profile_page_bloc.dart';

enum GetCityVnStatus { initial, success, failure }

enum GetDistrictStatus { initial, success, failure }

enum GetWardsStatus { initial, success, failure }

class ProfilePageState {
   String? districtName;
   String? cityName;
  String? wardsName;
  num? idCity;
  num? idDistrict;
  final List<Data> listCityVn;
  final List<Data> listDistrictVn;
  final List<Data> listWardVn;
  final GetCityVnStatus getCityVnStatus;
  final GetDistrictStatus getDistrictStatus;
  final GetWardsStatus getWardsStatus;

  ProfilePageState(
      {this.districtName,
      this.listCityVn = const <Data>[],
      this.listDistrictVn = const <Data>[],
      this.listWardVn = const <Data>[],
      this.getCityVnStatus = GetCityVnStatus.initial,
      this.cityName,
      this.idCity,
        this.idDistrict,
        this.wardsName,
      this.getDistrictStatus = GetDistrictStatus.initial,
      this.getWardsStatus = GetWardsStatus.initial});

  ProfilePageState copyWith(
      {List<Data>? listCityVn,
      List<Data>? listDistrictVn,
      List<Data>? listWardVn,
      GetCityVnStatus? getCityVnStatus,
      String? cityName,
      String? districtName,
        String? wardsName,
      num? idCity,
        num? idDistrict,
      GetDistrictStatus? getDistrictStatus,
      GetWardsStatus? getWardsStatus}) {
    return ProfilePageState(
        listCityVn: listCityVn ?? this.listCityVn,
        listDistrictVn: listDistrictVn ?? this.listDistrictVn,
        listWardVn: listWardVn ?? this.listWardVn,
        getCityVnStatus: getCityVnStatus ?? this.getCityVnStatus,
        cityName: cityName ?? this.cityName,
        wardsName: wardsName??this.wardsName,
        districtName: districtName ?? this.districtName,
        idCity: idCity ?? this.idCity,
        idDistrict: idDistrict??this.idDistrict,
        getDistrictStatus: getDistrictStatus ?? this.getDistrictStatus,
        getWardsStatus: getWardsStatus ?? this.getWardsStatus);
  }
}
