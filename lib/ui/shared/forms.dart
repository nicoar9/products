part of ui.shared;

class UIForms {
  static Widget emailInput(context, LoginViewModel model) {
    return StreamBuilder(
        stream: model.bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                ),
                hintText: 'example@email.com',
                labelText: 'Email Address',
                errorText: snapshot.error,
              ),
              onChanged: (value) => model.bloc.changeEmail(value),
            ),
          );
        });
  }

  static Widget passwordInput(context, LoginViewModel model) {
    return StreamBuilder(
      stream: model.bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                labelText: 'Password',
                errorText: snapshot.error),
            onChanged: (value) => model.bloc.changePassword(value),
          ),
        );
      },
    );
  }

  static Widget simpleFormField(
      {Function onSaveFunction,
      String initialValue,
      Function validateFunction,
      String text}) {
    return TextFormField(
      initialValue: initialValue,
      validator: validateFunction,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: text),
      onSaved: onSaveFunction,
    );
  }

  static Widget numberFormField(
      {Function onSaveFunction,
      String initialNumber,
      Function validateFunction,
      String text}) {
    return TextFormField(
      initialValue: initialNumber,
      validator: validateFunction,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: text),
      onSaved: onSaveFunction,
    );
  }
}
