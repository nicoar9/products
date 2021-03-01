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
}
