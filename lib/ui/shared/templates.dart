part of ui.shared;

class UITemplates {
  static Widget loginCardTemplate(context) {
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
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 60,
                ),
                UIForms.emailInput(),
                SizedBox(
                  height: 30,
                ),
                UIForms.passwordInput(),
                SizedBox(
                  height: 30,
                ),
                UIButtons._crearBoton(),
              ],
            ),
          ),
          Text('Olvido la contraseña?'),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
