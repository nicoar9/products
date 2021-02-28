part of app.ui.views;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(model.title),
              ),
              body: Container(),
              floatingActionButton: UIButtons.floatinActionButton(
                  () => Navigator.pushNamed(context, Routes.productView)),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
