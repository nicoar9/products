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
              floatingActionButton: UIButtons.floatinActionButton(() {
                model.productData.resetProduct();
                return Navigator.pushNamed(context, Routes.productView);
              }),
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
              return _loadItem(context, products[index], model);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _loadItem(
      BuildContext context, ProductModel prod, HomeViewModel model) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.amber,
        ),
        onDismissed: (direction) {
          model.productService.deleteProduct(prod.id);
        },
        child: ListTile(
            title: Text(prod.title),
            subtitle: Text(prod.price.toString()),
            onTap: () {
              model.productData.product = prod;
              print(model.productData.product.price.toString());
              Navigator.pushNamed(context, Routes.productView);
            }));
  }
}
