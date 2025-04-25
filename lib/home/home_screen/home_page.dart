



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_taskone/first_screen.dart';
import 'package:flutter_taskone/profile/profile_page/profile_page.dart';

import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  final String ? title;
  final String ? body;
  final List <File> ? image;

  const MyHomePage({ this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [ IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

        }, icon: Icon(Icons.account_box, size: 30))],

        title: Text("The ${title ?? "Porche"}"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty ? Image.asset("assets/images/porsche.jpeg")
                : Image.file(image![0], height: 300,width: double.infinity, fit: BoxFit.cover,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                const FavoriteWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                body ?? "Porsche is a world-renowned German automobile manufacturer known for producing high-performance sports cars, SUVs, and sedans. With iconic models like the 911, Porsche blends luxury, innovation, and speed in every vehicle.",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
           image == null || image!.isEmpty ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MyCollection(url: "assets/images/car.jpeg", text: "Old Money"),
                MyCollection(url: "assets/images/wheel.jpeg", text: "Wheels"),
              ],
            ):
            SizedBox(
              height: 500,
              child: GridView.builder(
                  itemCount: image!.length,
                  itemBuilder: (context, index)=>
                      Image.file(image![index], height: 200,width: 200, fit: BoxFit.cover,),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



