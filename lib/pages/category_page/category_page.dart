
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CheckboxListTile(
                  title: const Text("This is tittle"),
                  value: state.isChecked,
                  onChanged: (bool? newValue) {
                    context.read<CategoryBloc>().add(CheckBoxEvent());
                  })
            ],
          ),
        );
      },
    ));
  }
}
