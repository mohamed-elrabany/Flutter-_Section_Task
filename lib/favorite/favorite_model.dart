


import 'package:flutter/cupertino.dart';

import '../add_item/item.dart';

class FavoriteModel extends ChangeNotifier{

  List <Item> _fav=[];
  List<Item> get fav => _fav;

  add(Item item){
    if(!_fav.contains(item)) {
      _fav.add(item);
      notifyListeners();
    }
  }

  remove(Item item){
    if(_fav.contains(item)) {
      _fav.remove(item);
      notifyListeners();
    }
  }

  isFavorite(Item item){

    item.favorite =!item.favorite;
    item.favorite ? add(item) : remove(item);
    notifyListeners();

  }


}