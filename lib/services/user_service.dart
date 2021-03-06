import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  Future newUser(String email, String password) async {
    String _firebaseToken = 'AIzaSyBkBH5Qbo9Wdox88I-Hu4936AlIeF09kcc';

    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      //TODO: save token
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}
