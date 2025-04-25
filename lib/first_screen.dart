





import 'package:flutter/material.dart';
import 'package:flutter_taskone/main.dart';
import 'home/home_screen/home_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final ImagePicker imagePicker = ImagePicker();
  // Made final
  List <File> ? selectedImage= [];

  Future<void> imageSelector( ) async {
    List <XFile> ? images = await imagePicker.pickMultiImage();
    // list because i need to choose multiple images at a time

    if ( images != null && mounted ) {

      setState(() {
        selectedImage!.addAll(images.map((toElement) => File( toElement!.path)).toList());
        // here we converted the selcted images to a list of type File
        // this is a list of files and we need to convert it to a list of widgets
      });

    }
  }


  TextEditingController title= TextEditingController();
  TextEditingController body= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        title: Text("Fill Inputs"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),

      body: MergeSemantics(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover
            )
          ),
          child: ListView(
            children: [
              SizedBox(height: 30),
              selectedImage!.isEmpty ? Container(

                color: Colors.white38,
                height: 150,
                width: MediaQuery.sizeOf(context).width-20,
                child: IconButton(onPressed: (){
                  imageSelector();
                }, icon: Icon(Icons.camera_alt))
              )
               : Row(
                 children: [
                   Container(

                       color: Colors.white38,
                       height: 100,
                       width: 100,
                       child: IconButton(onPressed: (){
                         imageSelector();
                       }, icon: Icon(Icons.camera_alt))
                   ),
                   SizedBox(
                   height: 100,
                     width: MediaQuery.sizeOf(context).width-120,
                     child: ListView(
                     scrollDirection: Axis.horizontal,
                     children: selectedImage!.map((toElement) =>
                         Stack(
                           children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                               child: Image.file(toElement, height: 100,width: 100, fit: BoxFit.cover,),
                             ),
                             IconButton(onPressed: (){
                               setState(() {
                                 selectedImage!.removeAt(selectedImage!.indexOf(toElement));
                               });
                             }, icon: Icon(Icons.cancel))
                           ],
                         )).toList(),
                     ),
                   ),
                 ],
               ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "title"
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: body,
                  minLines: 3,
                  maxLines: 7,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "body"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.save) ,onPressed:() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              MyHomePage(
                title: title.text,
                body: body.text,
                image: selectedImage,
            ),
          ),
        );

      }),
    );
  }
}
