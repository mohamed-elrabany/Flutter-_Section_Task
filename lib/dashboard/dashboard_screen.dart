import 'package:flutter/material.dart';
import 'package:flutter_taskone/add_item/item.dart';
import 'package:flutter_taskone/add_item/item_model.dart';
import 'package:flutter_taskone/details/details_screen/details_page.dart';
import 'package:flutter_taskone/add_item/add_item_screen.dart';
import 'package:provider/provider.dart';
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProfile = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          Consumer<UserModel>(
            builder: (context, userModel, _) {
              final profileImage = userModel.user?.image;
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                icon:
                    profileImage == null
                        ? Icon(Icons.account_box, size: 30)
                        : CircleAvatar(
                          child: ClipOval(
                            child: Image.file(
                              profileImage,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                items.selectItem(Item(images: items.items[index].images, title: items.items[index].title, body: items.items[index].body, favorite: items.items[index].favorite));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
              child: SizedBox(
                child: Column(
                  children: [
                    Image.file(
                     items.items[index].images.first,
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(items.items[index].title),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
