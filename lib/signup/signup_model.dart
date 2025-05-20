

import 'package:flutter/cupertino.dart';
import 'package:flutter_taskone/profile/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_taskone/signup/user_data.dart';

import '../profile/user.dart';

class SignupModel extends ChangeNotifier{

  UserData ? _currentmodel;

  UserData? get currentUser => _currentmodel;

  TextEditingController  email = TextEditingController();
  TextEditingController  fullName = TextEditingController();
  TextEditingController   password = TextEditingController();
  TextEditingController  confirmPassword = TextEditingController();


  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    email.text = prefs.getString('user_email') ?? '';
    fullName.text = prefs.getString('user_fullname') ?? '';
    password.text = prefs.getString('user_password') ?? '';

    notifyListeners();
  }

  bool validateInputs(){

    if( email.text.isEmpty ||
        fullName.text.isEmpty ||
        password.text.isEmpty  ||
        confirmPassword.text.isEmpty){
      return false;
    }
    if(password.text != confirmPassword.text){
      return false;
    }
    return true;
  }

  Future<void> addUser() async {
    _currentmodel = UserData(
      email: email.text,
      fullName: fullName.text,
      password: password.text,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email.text);
    await prefs.setString('user_password', password.text);
    await prefs.setString('user_fullname', fullName.text);

    notifyListeners();
  }


  void clearVar(){
    email.clear();
    fullName.clear();
    password.clear();
    confirmPassword.clear();
  }

}