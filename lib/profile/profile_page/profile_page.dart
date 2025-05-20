import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_taskone/login/login_page/login_screen.dart';
import 'package:flutter_taskone/profile/user_model.dart';
import 'package:flutter_taskone/signup/signup_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Theme/theme_mode.dart';
import '../profile_widget/options.dart';
import "package:provider/provider.dart";

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();

    // Load user data once widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignupModel>(context, listen: false).loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using Consumer to rebuild UI when SignupModel changes
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
                builder: (context, userModel, child) {
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 100,
                        child: userModel.user?.image == null
                            ? Icon(Icons.person, size: 200, color: Colors.white38)
                            : ClipOval(
                          child: Image.file(
                            userModel.user!.image!,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
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
                                          onPressed: () {},
                                          title: "Edit",
                                          icon: Icons.edit,
                                        ),
                                        if (userModel.user?.image != null)
                                          Options(
                                            selectedImage: userModel.user?.image,
                                            onPressed: () {
                                              userModel.removeImage();
                                              Navigator.pop(context);
                                            },
                                            title: "Delete",
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
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: Consumer<SignupModel>(
                builder: (context, signupModel, child) {
                  final fullname = signupModel.fullName.text;
                  final email = signupModel.email.text;
                  final password = signupModel.password.text;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email"),
                            Text(email),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Password"),
                            Text('•' * password.length),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Name"),
                            Text(fullname),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Dark Mode"),
                            Consumer<ThemeProvider>(
                              builder: (context, themeProvider, child) {
                                return IconButton(
                                  onPressed: () {
                                    themeProvider.toggleTheme();
                                  },
                                  icon: Icon(
                                    themeProvider.lightMode
                                        ? Icons.dark_mode_outlined
                                        : Icons.light_mode_outlined,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();

                            signupModel.clearVar();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text('Logout'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
