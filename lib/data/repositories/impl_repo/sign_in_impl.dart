import 'package:dio_cache_flutter_test/core/api/core_api.dart';
import 'package:dio_cache_flutter_test/data/model/sign_in_model.dart';

import '../usecase_repo/sign_in_repo.dart';


class SignInImpl implements SignInRepo {
  final _customDio=CustomDio();

  Map<String, String> body(String? email, String? password) {
    return {
      "phone": email ?? "",
      "password": password ?? "",
      "group_code": "GUEST"
    };
  }

  @override
  Future<SignInModel> signIn({String? email, String? password}) async {
    final respond =
        await _customDio.post("/client/auth/login",
            body: body(email, password)
        );
    return SignInModel.fromJson(respond.data);
  }
}
