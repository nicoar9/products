part of app.ui.views;

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => SignUpViewModel());
  }
}
