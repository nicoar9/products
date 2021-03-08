part of app.ui.views;

class ProductViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final productBloc = locator<ProductsBloc>();

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

  void submit(context) async {
    if (formKey.currentState.validate() == false) {
      print('errors on inputs');
    }
    formKey.currentState.save();

    _save = true;
    notifyListeners();
    if (photo != null) {
      product?.photoUrl = await productBloc.uploadPhoto(photo);
    }

    if (product?.id == null) {
      productBloc.createProduct(product);
    } else {
      productBloc.updateProduct(product);
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

  _selectPhoto() async {
    processPhoto(ImageSource.gallery);
  }

  _takePhoto() async {
    processPhoto(ImageSource.camera);
  }

  processPhoto(imageSource) async {
    photo = await ImagePicker.pickImage(source: imageSource);

    if (photo != null) {
      product?.photoUrl = null;
    }

    notifyListeners();
  }
}
