part of app.ui.views;

class ProductViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final productData = locator<ProductData>();
  ProductModel product;

  void initProduct() {
    if (productData.product != null) {
      product = productData.product;
    }
    product = product;
  }

  final productService = ProductsService();

  String validateName(String value) {
    if (value.length < 3) {
      return 'enter producto name';
    }
    return null;
  }

  String validateNumber(String value) =>
      isNumeric(value) == true ? null : 'Only numbers';

  bool isNumeric(value) => value.isEmpty
      ? false
      : num.tryParse(value) == null
          ? false
          : true;

  void submit() {
    if (formKey.currentState.validate() == false) {
      print('errors on inputs');
    }
    formKey.currentState.save();

    if (product.id == null) {
      productService.createProduct(product);
    } else {
      productService.updateProduct(product);
    }
  }

  void switchOnChange(value) {
    product.available = value;
    notifyListeners();
  }
}
