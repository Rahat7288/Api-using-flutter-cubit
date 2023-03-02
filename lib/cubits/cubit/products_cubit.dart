import 'package:api_testing/models/product_model.dart';
import 'package:api_testing/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  // Future<List<Results>>? results;
  late ProductModel productModel;
  ApiService apiService;
  ProductsCubit({required this.apiService}) : super(ProductsInitial());

  Future<void> getAllProductList() async {
    try {
      emit(ProductsLoading());
      // results = (await apiService.getAllData()) as Future<List<Results>>;
      productModel = (await apiService.getAllData());
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
