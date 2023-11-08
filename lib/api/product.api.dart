import 'package:my_application/api/dio.config.dart';
import 'package:my_application/models/product.model.dart';

class ProductApi {
  Future<List<Product>> getAll(params) async {
    final response = await BaseDio().dio().get('/product/api/product/', queryParameters: params);
    late List<Product> productList;
    if (response.data['code'] == 200) {
      productList = (response.data['data'] as List).map((x) => Product.fromJson(x)).toList();
    }
    return productList;
  }
}