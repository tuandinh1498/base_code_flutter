import 'package:dio_cache_flutter_test/core/routes/names_routes.dart';
import 'package:dio_cache_flutter_test/pages/welcome_page/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
   const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc,WelcomeState>(
        builder:(context,state){
          return SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index){
                     context.read<WelcomeBloc>().add(TouchButton(page: index));
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    _aboadingItem(
                        firstTitle: "First Page", secondTitle: "Study With Me",index: 1),
                    _aboadingItem(
                        firstTitle: "Second Page", secondTitle: "Belong With You",index: 2),
                  ],
                ),
                _dotIndicator(context)

              ],
            ),
          );
        }
      )
    );
  }
  Widget _dotIndicator(BuildContext context) {
    return Positioned(
        bottom: 20,
        child: DotsIndicator(
          dotsCount: 2,
          position: context.watch<WelcomeBloc>().state.page,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24,12),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
        ));
  }

  Widget _aboadingItem(
      {String? firstTitle,
      String? secondTitle,
      required int index}) {
    return Column(
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Text("$firstTitle"),
        ),
        Text("$secondTitle"),
        const SizedBox(height: 100),
        Center(
          child:ElevatedButton(
            onPressed: () {
              print("$index");
              if(index<2){
                pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
              }else{
                Navigator.pushNamed(context, NameRoutes.signInPage);
              }
            },
            child: const Text("Next Page"),
          ),
        ),
      ],
    );
  }
}
