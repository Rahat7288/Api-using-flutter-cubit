import 'package:api_testing/cubits/cubit/products_cubit.dart';
import 'package:api_testing/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setting up the initial page for when ever the app launch it can call the api
    context.read<ProductsCubit>().getAllProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Testing Api'),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoded) {
            return ListView.builder(
              itemBuilder: (context, itemIndex) {
                Results results =
                    state.productModel.data.products.results[itemIndex];
                return ListTile(
                  leading: Text(results.id.toString()),
                  title: Text(results.productName),
                );
              },
              itemCount: state.productModel.data.products.results.length,
            );
          } else if (state is ProductsError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}
