part of ui.shared;

class UIForms {
  static Widget emailInput() {
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
        ),
      ),
    );
  }

  static Widget passwordInput() {
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
