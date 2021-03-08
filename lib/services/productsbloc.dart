import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:products_app/services/products_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:products_app/models/product_model.dart';

@lazySingleton
class ProductsBloc {
  final _productsController = BehaviorSubject<List<ProductModel>>();
  final _processingController = BehaviorSubject<bool>();

  final _productsService = ProductsService();

  Stream<List<ProductModel>> get productsStream => _productsController.stream;
  Stream<bool> get processing => _processingController.stream;

  void loadProducts() async {
    final products = await _productsService.loadProduct();
    _productsController.sink.add(products);
  }

  void createProduct(ProductModel product) async {
    _processingController.sink.add(true);
    await _productsService.createProduct(product);
    _processingController.sink.add(false);
  }

  Future<String> uploadPhoto(File photo) async {
    _processingController.sink.add(true);
    final photoUrl = await _productsService.uploadImage(photo);
    _processingController.sink.add(false);

    return photoUrl;
  }

  void updateProduct(ProductModel product) async {
    _processingController.sink.add(true);
    await _productsService.updateProduct(product);
    _processingController.sink.add(false);
  }

  void deleteProduct(String id) async {
    await _productsService.deleteProduct(id);
  }

  dispose() {
    _productsController?.close();
    _processingController?.close();
  }
}
