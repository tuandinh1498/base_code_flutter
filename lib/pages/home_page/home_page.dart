import 'package:dio_cache_flutter_test/pages/all_widget/all_widget.dart';
import 'package:dio_cache_flutter_test/pages/profile_page/profile_page.dart';
import 'package:dio_cache_flutter_test/pages/search_page/search_page.dart';
import 'package:dio_cache_flutter_test/pages/shop_page/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../category_page/category_page.dart';
import 'bloc /app_trigger /app_trigger__bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grid_3x3),
    label: 'Category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_outlined),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favourite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
];

const List<Widget> listPage = <Widget>[
  ShopPage(),
  CategoryPage(),
  SearchPage(),
  ProfilePage(),
  AllWidget()
];

class HomePage extends StatelessWidget {
  Map<String, dynamic>? data;

  HomePage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTriggerBloc, AppTriggerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              // appBar: AppBar(
              //   leading: IconButton(onPressed: () {
              //     Navigator.pop(context);
              //   }, icon: Icon(Icons.arrow_back_ios),
              //
              //   ),
              // ),
              body: listPage[state.tabIndex],
              bottomNavigationBar: _bottomNavBar(
                  state.tabIndex,
                  (currentIndex) => context
                      .read<AppTriggerBloc>()
                      .add(TabChange(tabIndex: currentIndex))));
        });
  }

  Widget _bottomNavBar(int currentState, Function(int) onTap) {
    return BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.orange,
        iconSize: 15,
        currentIndex: currentState,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        items: bottomNavItems);
  }
}
