part of app.ui.views;

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: Stack(
              children: [
                UIBackground.loginBackground(
                  context,
                ),
                UITemplates.loginCardTemplate(context)
              ],
            )),
        viewModelBuilder: () => LoginViewModel());
  }
}
