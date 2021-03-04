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
    return FutureBuilder(
      future: model.productService.loadProduct(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return _loadItem(context, products[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _loadItem(BuildContext context, ProductModel prod) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.amber,
        ),
        child: ListTile(
          title: Text(prod.title),
          subtitle: Text(prod.price.toString()),
          onTap: () => Navigator.pushNamed(context, Routes.productView),
        ));
  }
}
