import 'package:dio_cache_flutter_test/pages/search_page/bloc%20/search__bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/search_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onEditingComplete: (){
                    context.read<SearchBloc>().add(SearchSubmit(searchValue:_searchController.text.toLowerCase()));
                  },
                  onFieldSubmitted: (search) {

                  },
                  decoration: InputDecoration(
                      hintText: "Tim kiem sp",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1.0))),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  switch (state.status) {
                    case SearchStatus.failure:
                      return const Center(
                          child: Text('failed to fetch Products'));
                    case SearchStatus.success:
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListItem(product: state.products[index]);
                        },
                        itemCount: state.products.length,
                      );
                    case SearchStatus.initial:
                      return Center(child: CircularProgressIndicator(),);
                  }
                }
                )
              ],
            ),
          ),
        )
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({required this.product, super.key});

  final Products product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${product.id}', style: textTheme.bodySmall),
        title: Text(product.title ?? ""),
        isThreeLine: true,
        subtitle: Text("${product.price}"),
        dense: true,
      ),
    );
  }
}
