part of app.ui.views;

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Product'),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.photo_size_select_actual),
                      onPressed: () {}),
                  IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      UIForms.simpleFormField(
                          text: 'Product',
                          validateFunction: (String value) =>
                              model.validateName(value)),
                      UIForms.numberFormField(
                          text: 'Price',
                          validateFunction: (String value) =>
                              model.validateNumber(value)),
                      UIButtons.buttonIcon(text: 'Save', function: () {}),
                    ],
                  )),
                ),
              ),
            ),
        viewModelBuilder: () => ProductViewModel());
  }
}
