import 'dart:convert';
import 'package:api_testing/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductModel> getAllData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice'));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        ProductModel productModel = ProductModel.fromJson(responseData);

        return productModel;
      } else {
        throw Future.error(
            'Unable to get the data. status code: ${response.statusCode}');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
