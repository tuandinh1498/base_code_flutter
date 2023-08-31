part of 'profile_page_bloc.dart';

@immutable
abstract class ProfilePageEvent {
  const ProfilePageEvent();
}

class FetchCityVnEvent extends ProfilePageEvent {}

class ChangeCityEvent extends ProfilePageEvent {
  final String cityName;
  const ChangeCityEvent({required this.cityName});
}

class FetchDistrictEvent extends ProfilePageEvent{
  final num? cityId;
  const FetchDistrictEvent({required this.cityId});
}

class FetchWardsEvent extends ProfilePageEvent{
  final num? districtId;
  const FetchWardsEvent({required this.districtId});
}

class ChangeDistrictEvent extends ProfilePageEvent {
  final String districtName;
  const ChangeDistrictEvent({required this.districtName});
}

class ChangeWardEvent extends ProfilePageEvent {
  final String wardsName;
  const ChangeWardEvent({required this.wardsName});
}
