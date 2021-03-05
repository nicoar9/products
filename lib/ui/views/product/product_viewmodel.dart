part of app.ui.views;

class ProductViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _save;
  File photo;

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

  void submit(context) {
    if (formKey.currentState.validate() == false) {
      print('errors on inputs');
    }
    formKey.currentState.save();

    _save = true;

    if (product.id == null) {
      productService.createProduct(product);
    } else {
      productService.updateProduct(product);
    }
    notifyListeners();
    ScaffoldMessenger.of(context)
        .showSnackBar(UISnackbar.simpleSnackbar('Product Added'));
    Navigator.pop(context);
  }

  void switchOnChange(value) {
    product.available = value;
    notifyListeners();
  }

  Widget _showPhoto() {
    if (product.photoUrl != null) {
      //TODO:
      return Container();
    } else {
      return Image(
        image: AssetImage(photo?.path ?? 'assets/no-image.png'),
        height: 300,
        fit: BoxFit.cover,
      );
    }
  }

  _selectPhoto() async {
    processPhoto(ImageSource.gallery);
  }

  _takePhoto() async {
    processPhoto(ImageSource.camera);
  }

  processPhoto(imageSource) async {
    photo = await ImagePicker.pickImage(source: imageSource);

    if (photo != null) {}

    notifyListeners();
  }
}
