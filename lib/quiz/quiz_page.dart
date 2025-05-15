import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final profileImage = userModel.user?.image;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mohamed Loay',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: profileImage == null
                ? const Icon(Icons.account_box, size: 30)
                : CircleAvatar(
              backgroundImage: FileImage(profileImage),
              radius: 15,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We are built for software teams",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Our mission is to ensure teams can do their best work, no matter their size or budget. We focus on the details of everything we do.",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Divider(color: Colors.black87, height: 20),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Meet Our Team",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Our philosophy is simple: hire a team of diverse, passionate people and foster a culture that empowers you to do your best work.",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            if (profileImage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4, // placeholder: show 4 team members
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              profileImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                         SizedBox(height: 4),
                         Text("Mobile Developer"),
                         Text(
                          "Former Tesla rejected software developer",
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook),
                            SizedBox(width: 10),
                            Icon(Icons.headphones),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("No team images available. Please add a profile image."),
              ),
          ],
        ),
      ),
    );
  }
}
