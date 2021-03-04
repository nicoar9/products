import 'package:injectable/injectable.dart';
import 'package:products_app/models/product_model.dart';

@lazySingleton
class ProductData {
  ProductModel product;
}
