import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/commom_widget/skeleton.dart';
import '../../data/model/products_model.dart';
import 'bloc/product_bloc.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductStatus.failure:
            return const Center(child: Text('failed to fetch Products'));
          case ProductStatus.success:
            if (state.products.isEmpty) {
              return const Center(child: Text('no Products'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.products.length
                    ? const BottomLoader()
                    : ProductListItem(product: state.products[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.products.length
                  : state.products.length + 1,
              controller: _scrollController,
            );
          case ProductStatus.initial:
            return const Center(child: ShimmerLoading());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ProductBloc>().add(FetchProduct());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
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

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 24,
      child: Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: const Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Skeleton(height: 120, width: double.infinity)),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Skeleton(height: 20, width: double.infinity),
                          Skeleton(height: 20, width: double.infinity),
                        ],
                      ))
                ],
              ));
        });
  }
}
