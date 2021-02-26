part of ui.shared;

class UIButtons {
  static Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      onPressed: () {},
    );
  }
}
