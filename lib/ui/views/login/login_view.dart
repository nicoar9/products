part of app.ui.views;

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Text('Login Page'),
              ),
            ),
        viewModelBuilder: () => LoginViewModel());
  }
}
