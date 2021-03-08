import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/services/user_preferences.dart';

class ProductsService {
  final String _url = 'https://flutter-1f063-default-rtdb.firebaseio.com';
  final _prefs = UserPreferences();

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = '$_url/products/${product.id}.json?auth=${_prefs.token}';

    final resp = await http.put(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<List<ProductModel>> loadProduct() async {
    final url = '$_url/products.json?auth=${_prefs.token}';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    List<ProductModel> products = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;

      products.add(prodTemp);
    });
    return products;
  }

  Future<void> deleteProduct(String id) async {
    final url = '$_url/products/$id.json?auth=${_prefs.token}';

    final resp = await http.delete(url);
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dyrpxoxni/image/upload?upload_preset=kuyiiuxj');
    final mimeType = mime(image.path).split('/');
    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('something went wrong');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}
