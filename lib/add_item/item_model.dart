

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'item.dart';

class ItemModel extends ChangeNotifier{
  final List<Item> _items=[];
  List<Item> get items => _items;
  
  void addItem(Item item){
    _items.add(item);
    notifyListeners();
  }

  final ImagePicker imagePicker = ImagePicker();
  // Made final
  List <File> ? selectedImage= [];

  Future<void> imageSelector( ) async {
    List <XFile> ? images = await imagePicker.pickMultiImage();
    // list because i need to choose multiple images at a time

    if ( images != null ) {

        selectedImage!.addAll(images.map((toElement) => File( toElement!.path)).toList());
        notifyListeners();

    }
  }
  removeImage(index){
    selectedImage!.removeAt(index);
    notifyListeners();
  }

  Item ? _selectedItem;
  Item ? get selctedItem => _selectedItem;

  void selectItem(Item item){
    _selectedItem= item;
    notifyListeners();
  }

}