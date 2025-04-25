import 'package:flutter/material.dart';





class MyCollection extends StatelessWidget {
  final String url;
  final String text;

  const MyCollection({
    required this.url,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          url,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}