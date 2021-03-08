part of app.ui.views;

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: Stack(
              children: [
                UIBackground.loginBackground(
                  context,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SafeArea(
                        child: Container(
                          height: 180,
                        ),
                      ),
                      Container(
                        width: model.sizeWidth(context) * 0.85,
                        padding: EdgeInsets.symmetric(vertical: 50),
                        margin: EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0, 5),
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Create New Account',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            UIForms.emailInput(context, model),
                            SizedBox(
                              height: 30,
                            ),
                            UIForms.passwordInput(context, model),
                            SizedBox(
                              height: 30,
                            ),
                            UIButtons.loginButton(model, function: () async {
                              Map info = await model.userService.newUser(
                                  model.bloc.email, model.bloc.password);

                              if (info['ok']) {
                                Navigator.pushReplacementNamed(
                                    context, Routes.homeView);
                              } else {
                                Validators.showAlert(context, info['message']);
                              }
                            })
                          ],
                        ),
                      ),
                      FlatButton(
                        child: Text('Already have an Account? Log-in'),
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, Routes.loginView),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            )),
        viewModelBuilder: () => SignUpViewModel());
  }
}
