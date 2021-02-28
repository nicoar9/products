part of app.ui.views;

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => _title;
  LoginBloc loginBloc = locator<LoginBloc>();
}
