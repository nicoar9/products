part of app.ui.views;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text(model.title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.loginBloc.email),
                Text(model.loginBloc.password),
              ],
            )),
        viewModelBuilder: () => HomeViewModel());
  }
}
