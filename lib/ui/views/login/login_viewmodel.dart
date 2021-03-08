part of app.ui.views;

class LoginViewModel extends BaseViewModel {
  final UserService userService = UserService();

  Map info;

  final bloc = locator<LoginBloc>();

  double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double sizeHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
