part of ui.shared;

class UITemplates {
  static Widget loginCardTemplate(BuildContext context, LoginViewModel model) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
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
                UIButtons._crearBoton(),
              ],
            ),
          ),
          Text('Forgot Password?'),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
