part of app.ui.views;

class ProductViewModel extends BaseViewModel {
  final formkey = GlobalKey<FormState>();

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

  void submit() => !formkey.currentState.validate()
      ? print('errors on inputs')
      : print('Everything working!');
}
