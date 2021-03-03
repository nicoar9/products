import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_app/models/product_model.dart';

class ProductsService {
  final String _url = 'https://flutter-1f063-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';

    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProduct() async {
    final url = '$_url/products.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    List<ProductModel> products = List();

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;

      products.add(prodTemp);
    });
    print(products[0].id);
    return products;
  }
}
