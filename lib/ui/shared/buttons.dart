part of ui.shared;

class UIButtons {
  static Widget loginButton(LoginViewModel model, {Function function}) {
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
            onPressed: snapshot.hasData ? function : null);
      },
    );
  }

  static Widget floatinActionButton(function) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: function);
  }

  static Widget buttonIcon({Function function, String text}) {
    return RaisedButton.icon(
      onPressed: function,
      icon: Icon(Icons.save),
      label: Text('$text'),
      color: Colors.deepPurple,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
