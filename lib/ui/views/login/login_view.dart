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
                              'Log In',
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
                              model.info = await model.userService
                                  .login(model.bloc.email, model.bloc.password);
                              if (model.info['ok']) {
                                Navigator.pushReplacementNamed(
                                    context, Routes.homeView);
                              } else {
                                Validators.showAlert(
                                    context, model.info['message']);
                              }
                              // return Navigator.pushReplacementNamed(
                              //     context, Routes.homeView);
                            })
                          ],
                        ),
                      ),
                      FlatButton(
                        child: Text('Sign Up for Free'),
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, Routes.signUpView),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            )),
        viewModelBuilder: () => LoginViewModel());
  }
}
