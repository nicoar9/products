part of ui.shared;

class UIButtons {
  static Widget _crearBoton(LoginViewModel model) {
    return StreamBuilder(
      stream: model.bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text('Log In'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.deepPurple,
            textColor: Colors.white,
            elevation: 0,
            onPressed: snapshot.hasData ? () {} : null);
      },
    );
  }
}
