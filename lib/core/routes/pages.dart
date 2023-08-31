import 'package:dio_cache_flutter_test/core/routes/names_routes.dart';
import 'package:dio_cache_flutter_test/pages/home_page/home_page.dart';
import 'package:dio_cache_flutter_test/pages/sign_in_page/sign_in_page.dart';
import 'package:dio_cache_flutter_test/pages/welcome_page/welcome.dart';
import 'package:flutter/material.dart';
class AppRoutes{
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoutes.initial:
        return MaterialPageRoute(builder: (_){
          return const WelcomePage();
        });
      case NameRoutes.signInPage:
        return MaterialPageRoute(builder: (_){
          return const SignInPage();
        });
      case NameRoutes.homePage:
        Map<String, dynamic>? data=settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(builder: (_){
          return  HomePage(data: data);
        });
      default:
        return MaterialPageRoute(builder: (_){
          return const WelcomePage();
        });

    }
  }
}

