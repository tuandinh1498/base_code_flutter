import 'package:dio_cache_flutter_test/core/api/core_api.dart';
import 'package:dio_cache_flutter_test/core/routes/names_routes.dart';
import 'package:dio_cache_flutter_test/pages/sign_in_page/bloc%20/sign_in_bloc.dart';
import 'package:dio_cache_flutter_test/pages/sign_in_page/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/configs/validations.dart';
import '../../data/repositories/impl_repo/sign_in_impl.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state.signInStatus == SignInStatus.success) {
              String token=state.token ?? "";
              Navigator.pushNamed(context, NameRoutes.homePage,arguments: {
                'token': token,
              }
              );
            }else if (state.signInStatus == SignInStatus.failure){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text("loi mang r e oi "),
            ),
            );
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: Validator.validateEmail,
                    decoration: InputDecoration(
                        hintText: "Vui long nhap email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0))),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: Validator.validateEmail,
                    decoration: InputDecoration(
                        hintText: "Vui long nhap email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignInBloc>().add(LoginEvent(
                            email: _emailController.text,
                            password: _passwordController.text));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
