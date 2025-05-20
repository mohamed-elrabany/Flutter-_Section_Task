import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends ChangeNotifier{

  TextEditingController enteredEmail = TextEditingController();
  TextEditingController enteredPassword = TextEditingController();

  Future<bool> checkLogin() async {

    if(enteredEmail.text.isEmpty || enteredPassword.text.isEmpty){
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('logged_in', false);

    String? savedEmail = prefs.getString('user_email');
    String? savedPassword = prefs.getString('user_password');

    if (savedEmail == enteredEmail.text && savedPassword == enteredPassword.text) {
      await prefs.setBool('logged_in', true);
      return true;
    } else {
      return false;
    }
  }

  void clearVar(){
    enteredEmail.clear();
    enteredPassword.clear();
  }

}