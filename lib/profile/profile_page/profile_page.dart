import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_taskone/profile/user_model.dart';
import 'package:image_picker/image_picker.dart';
import '../profile_widget/options.dart';
import "package:provider/provider.dart";

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Consumer<UserModel>(
                builder: (context, userModel, child){
                 return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 100,
                      child: userModel.user?.image == null
                          ? Icon(Icons.person, size: 200, color: Colors.white38)
                          : ClipOval(child: Image.file(
                        userModel.user!.image!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,)),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      const Text("Profile",
                                          style: TextStyle(fontSize: 25)),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Options(
                                            onPressed: () {
                                              userModel.imageSelector(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            title: "Camera",
                                            icon: Icons.camera_alt,
                                          ),
                                          Options(
                                            onPressed: () {
                                              userModel.imageSelector(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            title: "Gallery",
                                            icon: Icons.image,
                                          ),
                                          Options(
                                            onPressed: () {

                                            },
                                            title: "Edit",
                                            icon: Icons.edit,
                                          ),
                                          if(userModel.user?.image != null)
                                            Options(
                                              selectedImage: userModel.user?.image,
                                              onPressed: () {
                                                userModel.removeImage();
                                                Navigator.pop(context);
                                              },
                                              title: "delete",
                                              icon: Icons.delete,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          );
                        },
                        icon: const Icon(
                            Icons.camera_alt, size: 35, color: Colors.grey),
                      ),
                    )
                  ],
                );
                 },
              ),
            ),
        
            Container(
              width: double.infinity, // Ensures the container stretches full width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align all children to the start (left)
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                        Text("email"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password"),
                        Text("*******"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name"),
                        Text("Mohamed Loay"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone"),
                        Text("+201011993597"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender"),
                        Text("Male"),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Dark Mode"),
                          IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.dark_mode_outlined))
                        ],),
                      ],
                    ),
                  ),

        
                ],
              ),
            )
        
        
          ],
        ),
      ),

    );
  }
}


