part of app.ui.views;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(model.title),
              ),
              body: _productsList(model),
              floatingActionButton: UIButtons.floatinActionButton(
                  () => Navigator.pushNamed(context, Routes.productView)),
            ),
        viewModelBuilder: () => HomeViewModel());
  }

  Widget _productsList(HomeViewModel model) {
    FutureBuilder(
      future: model.productService.loadProduct(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
