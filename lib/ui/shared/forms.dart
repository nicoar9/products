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
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
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
          labelText: 'Contraseña',
        ),
      ),
    );
  }
}
