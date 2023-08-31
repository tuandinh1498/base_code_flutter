import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_cache_flutter_test/data/repositories/impl_repo/get_city_vn_impl.dart';
import 'package:dio_cache_flutter_test/data/repositories/impl_repo/get_district_vn_impl.dart';
import 'package:dio_cache_flutter_test/data/repositories/impl_repo/get_wards_vn_impl.dart';
import 'package:meta/meta.dart';

import '../../../data/model/get_city_vn_model.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageState()) {
    on<FetchCityVnEvent>(_onFetchCityVn);
    on<ChangeCityEvent>(_onChangeCity);
    on<ChangeDistrictEvent>(_onChangeDistrict);
    on<FetchDistrictEvent>(_onFetchDistrictVn);
    on<FetchWardsEvent>(_onFetchWadsVn);
    on<ChangeWardEvent>(_onChangeWards);

  }
  final getCityVnImpl = GetCityVnImpl();
  final getDistrictImpl=GetDistrictVnImpl();
  final getWardsImpl=GetWardsVnImpl();

  Future<void> _onFetchCityVn(FetchCityVnEvent fetchCityVnEvent,
      Emitter<ProfilePageState> emitter) async {
    emitter(state.copyWith(getCityVnStatus: GetCityVnStatus.initial));
    try {
      final cityVn = await getCityVnImpl.getCityVn();
      emitter(state.copyWith(
          getCityVnStatus: GetCityVnStatus.success, listCityVn: cityVn.data));
    } catch (_) {
      emitter(state.copyWith(getCityVnStatus: GetCityVnStatus.failure));
    }
  }

  Future<void> _onFetchDistrictVn(FetchDistrictEvent fetchCityVnEvent,
      Emitter<ProfilePageState> emitter) async {
    emitter(state.copyWith(getDistrictStatus: GetDistrictStatus.initial));
    try {
      final district = await getDistrictImpl.getDistrictVn(cityId: state.idCity);
      emitter(state.copyWith(
          getDistrictStatus: GetDistrictStatus.success, listDistrictVn: district.data));
    } catch (_) {
      emitter(state.copyWith(getDistrictStatus: GetDistrictStatus.failure));
    }
  }

  Future<void> _onFetchWadsVn(FetchWardsEvent fetchCityVnEvent,
      Emitter<ProfilePageState> emitter) async {
    emitter(state.copyWith(getWardsStatus: GetWardsStatus.initial));
    try {
      final wards = await getWardsImpl.getWardsVn(districtId: state.idCity);
      emitter(state.copyWith(
          getWardsStatus: GetWardsStatus.success, listWardVn: wards.data));
    } catch (_) {
      emitter(state.copyWith(getWardsStatus: GetWardsStatus.failure));
    }
  }

  void _onChangeCity(
      ChangeCityEvent fetchCityVnEvent, Emitter<ProfilePageState> emitter) {
    emitter(state.copyWith(cityName: fetchCityVnEvent.cityName));
    state.idCity=null;
    state.districtName=null;
    getIdCity(emitter);

    print(state.idCity);

  }

  void _onChangeDistrict(
      ChangeDistrictEvent fetchDistrictEvent, Emitter<ProfilePageState> emitter) {
    emitter(state.copyWith(districtName: fetchDistrictEvent.districtName));
    state.idDistrict=null;
    state.wardsName=null;
    getIdDistrict(emitter);

    print(state.idCity);

  }

  void _onChangeWards(
      ChangeWardEvent fetchWardsVnEvent, Emitter<ProfilePageState> emitter) {
    emitter(state.copyWith(wardsName: fetchWardsVnEvent.wardsName));

  }

  void getIdCity(Emitter<ProfilePageState> emitter) {
    for(var city in state.listCityVn){
      if(state.cityName==city.name){
        emitter(state.copyWith(idCity: city.id));
      }
    }
  }

  void getIdDistrict(Emitter<ProfilePageState> emitter) {
    for(var district in state.listDistrictVn){
      if(state.districtName==district.name){
        emitter(state.copyWith(idCity: district.id));
      }
    }
  }


}
