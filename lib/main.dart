import 'package:dio_cache_flutter_test/core/app_bloc_providers/app_bloc_providers.dart';
import 'package:dio_cache_flutter_test/core/configs/them_data.dart';
import 'package:dio_cache_flutter_test/pages/home_page/home_page.dart';
import 'package:dio_cache_flutter_test/pages/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/names_routes.dart';
import 'core/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themings.lighTheme,
        // initialRoute: NameRoutes.signInPage,
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        home: HomePage(),
      ),
    );
  }
}

