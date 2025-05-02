import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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