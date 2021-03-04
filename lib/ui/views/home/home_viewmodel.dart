part of app.ui.views;

class HomeViewModel extends BaseViewModel {
  final productData = locator<ProductData>();

  String _title = 'Home View';
  String get title => _title;
  LoginBloc loginBloc = locator<LoginBloc>();
  final productService = ProductsService();
}
