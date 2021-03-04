part of ui.shared;

class UISnackbar {
  static Widget simpleSnackbar(String text) {
    return SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 1500),
    );
  }
}
