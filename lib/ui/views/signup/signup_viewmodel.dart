part of app.ui.views;

class SignUpViewModel extends LoginViewModel {
  final userService = UserService();

  Map info;

  double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double sizeHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
