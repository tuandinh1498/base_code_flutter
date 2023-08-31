import 'package:dio_cache_flutter_test/pages/profile_page/bloc/profile_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final list = ["Apple", "Orange", "Kiwi", "Banana", "Grape"];
  List<DropdownMenuItem<String>> createList() {
    return list
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  // String? state.cityName="Hậu Giang";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        switch (state.getCityVnStatus) {
          case GetCityVnStatus.failure:
            return const Center(child: Text('failed to fetch Products'));
          case GetCityVnStatus.success:
            final city = state.listCityVn;
            final List<DropdownMenuItem<String>> listMenuItem = city
                .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                    value: item.name, child: Text(item.name ?? "")))
                .toList();
            return DropdownButton(
                items: listMenuItem,
                hint: Text("Vui lòng chọn thành phố "),
                value: state.cityName,
                onChanged: (value) {
                  context
                      .read<ProfilePageBloc>()
                      .add(ChangeCityEvent(cityName: value ?? ""));
                  context
                      .read<ProfilePageBloc>()
                      .add(FetchDistrictEvent(cityId: state.idCity));
                });
          case GetCityVnStatus.initial:
            return CircularProgressIndicator();
        }
      }),
          BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
            switch (state.getDistrictStatus) {
              case GetDistrictStatus.failure:
                return const Center(child: Text('failed to fetch Products'));
              case GetDistrictStatus.success:
                final district = state.listDistrictVn;
                final List<DropdownMenuItem<String>> listMenuItem = district
                    .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                    value: item.name, child: Text(item.name ?? "")))
                    .toList();
                return DropdownButton(
                    items: listMenuItem,
                    hint: Text("Vui lòng chọn huyện"),
                    value: state.districtName,
                    onChanged: (value) {
                      context
                          .read<ProfilePageBloc>()
                          .add(ChangeDistrictEvent(districtName: value ?? ""));
                      context
                          .read<ProfilePageBloc>()
                          .add(FetchWardsEvent(districtId: state.idDistrict));
                    });
              case GetDistrictStatus.initial:
                return CircularProgressIndicator();
            }
          }),
          BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
            switch (state.getWardsStatus) {
              case GetWardsStatus.failure:
                return const Center(child: Text('failed to fetch Products'));
              case GetWardsStatus.success:
                final wards = state.listWardVn;
                final List<DropdownMenuItem<String>> listMenuItem = wards
                    .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                    value: item.name, child: Text(item.name ?? "")))
                    .toList();
                return DropdownButton(
                    items: listMenuItem,
                    hint: Text("Vui lòng chọn xã"),
                    value: state.wardsName,
                    onChanged: (value) {
                      context
                          .read<ProfilePageBloc>()
                          .add(ChangeWardEvent(wardsName: value ?? ""));
                    });
              case GetWardsStatus.initial:
                return CircularProgressIndicator();
            }
          })
    ]));
  }
}
