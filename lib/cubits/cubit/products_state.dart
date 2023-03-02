// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoded extends ProductsState {
  ProductModel productModel;
  // List<Results> results;
  ProductsLoded({
    required this.productModel,
    // required this.results,
  });
  // Data get data => productModel.data;

  @override
  List<Object> get props => [productModel];
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
