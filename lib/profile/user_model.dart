

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_taskone/profile/user.dart';
import 'package:image_picker/image_picker.dart';

class UserModel extends ChangeNotifier{

  // Removed const
  final ImagePicker imagePicker = ImagePicker();
  // Made final
  //File? selectedImage;

  User ? _user;
  User ? get user => _user;

  Future<void> imageSelector( ImageSource source ) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if ( image != null ) {
      if(_user != null){
        _user ?.image= File(image!.path);
      }else{
        _user= User(
            name: "",
            bio: "",
            image: File(image!.path));
      }


        notifyListeners();

    }
  }

  removeImage(){
        _user?.image = null;
        notifyListeners();
  }


}