import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_taskone/add_item/item_model.dart';
import 'package:flutter_taskone/profile/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

import '../../profile/user_model.dart';
import '../details_widget/favorite_widget.dart';
import '../details_widget/statck_widget.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemModel>(context);
    final selectedItem = items.selctedItem;

    return Scaffold(
      appBar: AppBar(
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
                icon: profileImage == null
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
        title: Text("The ${selectedItem?.title ?? "Porche"}"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      body: selectedItem == null
          ? Center(child: Text("No item selected."))
          : SingleChildScrollView(
        child: Column(
          children: [
            if (selectedItem.images.isNotEmpty)
              Image.file(
                selectedItem.images.first,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
                selectedItem.body,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: selectedItem.images.length,
                itemBuilder: (context, index) => Image.file(
                  selectedItem.images[index],
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
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
