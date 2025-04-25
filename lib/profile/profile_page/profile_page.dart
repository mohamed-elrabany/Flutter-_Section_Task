import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 // Removed const
  final ImagePicker imagePicker = ImagePicker();
 // Made final
  File? selectedImage;

  Future<void> imageSelector( ImageSource source ) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if ( image != null && mounted ) {

      setState(() {
        selectedImage = File(image!.path);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 100,
                  child: selectedImage == null
                      ? Icon(Icons.person, size: 200, color: Colors.white38)
                      : ClipOval(child: Image.file(selectedImage!, fit: BoxFit.cover, height: 200,width: 200,)),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              const Text("Profile", style: TextStyle(fontSize: 25)),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Options(
                                    onPressed: () {
                                      imageSelector(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    title: "Camera",
                                    icon: Icons.camera_alt,
                                  ),
                                  Options(
                                    onPressed: () {
                                      imageSelector(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    title: "Gallery",
                                    icon: Icons.image,
                                  ),
                                  if(selectedImage != null)
                                      Options(
                                        selectedImage: selectedImage,
                                        onPressed: () {
                                          if(mounted){
                                            setState(() {
                                              selectedImage= null;
                                            });
                                          }
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
                    icon: const Icon(Icons.camera_alt, size: 35, color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final Colors? color;
  final VoidCallback onPressed;
  final File ? selectedImage;

  const Options({
    required this.onPressed,
    this.color,
    this.selectedImage,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          color: selectedImage == null ? Colors.grey.shade800 : Colors.red,
          icon: Icon(
            icon, size: 30,),
        ),
        Text(title, style: TextStyle(
            color: selectedImage == null ? Colors.grey.shade800 : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w600)),
      ],
    );
  }
}
