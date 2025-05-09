

import 'package:flutter/material.dart';
import 'package:flutter_taskone/favorite/favorite_model.dart';
import 'package:provider/provider.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( title: Text("Favorite"),

      ),

    body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Consumer<FavoriteModel>(
    builder: (context, fav, child)=>
      GridView.builder(
      itemCount: fav.fav.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
      return SizedBox(
      child: Column(
      children: [
      Image.file(
      fav.fav[index].images.first,
      width: double.infinity,
      height: 140,
      fit: BoxFit.cover,
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(fav.fav[index].title),
      IconButton(
      onPressed: () {
        fav.fav[index].favorite=false;
      fav.remove(fav.fav[index]);
      },
      icon: const Icon(Icons.favorite, color: Colors.red,),
      ),
      ],
      ),
      ],
      ),
      );
      },
      ),
    ),

    ),
    );
  }
}
