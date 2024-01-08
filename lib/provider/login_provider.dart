import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      http.Response response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        print('succesfull');

        final snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Successful'),
          duration: Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setLoading(false);
      } else {
        print('failed');
        setLoading(false);
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login Failed'),
          duration: Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
