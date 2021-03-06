part of app.ui.views;

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        onModelReady: (ProductViewModel model) => model.initProduct(),
        builder: (context, model, child) => Scaffold(
              key: model.scaffoldKey,
              appBar: AppBar(
                title: Text('Product'),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.photo_size_select_actual),
                      onPressed: () => model._selectPhoto()),
                  IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () => model._takePhoto()),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: <Widget>[
                        _showProduct(model),
                        UIForms.simpleFormField(
                            initialValue: model.product.title,
                            text: 'Product',
                            validateFunction: (String value) =>
                                model.validateName(value),
                            onSaveFunction: (String value) =>
                                model.product.title = value),
                        UIForms.numberFormField(
                            initialNumber: model.product.price.toString(),
                            text: 'Price',
                            validateFunction: (String value) =>
                                model.validateNumber(value),
                            onSaveFunction: (String value) =>
                                model.product.price = double.parse(value)),
                        SwitchListTile(
                          value: model.product.available,
                          onChanged: (value) => model.switchOnChange(value),
                        ),
                        UIButtons.buttonIcon(
                            text: 'Save',
                            function: model._save == true
                                ? null
                                : () => model.submit(context)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ProductViewModel());
  }

  Widget _showProduct(ProductViewModel model) {
    if (model.product.photoUrl != null) {
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(model.product.photoUrl),
        height: 300,
        fit: BoxFit.contain,
      );
    }
    if (model.photo != null) {
      return Image.file(
        model.photo,
        height: 300,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'assets/no-image.png',
        height: 300,
        fit: BoxFit.cover,
      );
    }
  }
}
