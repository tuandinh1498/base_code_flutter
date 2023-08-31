
import 'package:dio_cache_flutter_test/pages/home_page/bloc%20/app_trigger%20/app_trigger__bloc.dart';
import 'package:dio_cache_flutter_test/pages/profile_page/bloc/profile_page_bloc.dart';
import 'package:dio_cache_flutter_test/pages/search_page/bloc%20/search__bloc.dart';
import 'package:dio_cache_flutter_test/pages/shop_page/bloc/product_bloc.dart';
import 'package:dio_cache_flutter_test/pages/sign_in_page/bloc%20/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/category_page/bloc/category_bloc.dart';
import '../../pages/welcome_page/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (_) => WelcomeBloc()),
        BlocProvider(create: (_) => SignInBloc()),
        BlocProvider(create: (_) => AppTriggerBloc()),
        BlocProvider(create: (_) => ProductBloc()..add(FetchProduct())),
        BlocProvider(create: (_) => SearchBloc()),
        BlocProvider(create: (_) => CategoryBloc()),
        BlocProvider(create: (_) => ProfilePageBloc()..add(FetchCityVnEvent()))
      ];
}
