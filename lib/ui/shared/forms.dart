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
                  counterText: snapshot.data),
              onChanged: (value) => model.bloc.changeEmail(value),
            ),
          );
        });
  }

  static Widget passwordInput(context, LoginViewModel model) {
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
        ),
      ),
    );
  }
}
