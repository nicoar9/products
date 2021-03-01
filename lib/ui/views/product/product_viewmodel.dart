part of app.ui.views;

class ProductViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProductModel product = ProductModel();

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

  void submit() => formKey.currentState.validate() == false
      ? print('errors on inputs')
      : formKey.currentState.save();

  void switchOnChange(value) {
    product.available = value;
    notifyListeners();
  }
}
