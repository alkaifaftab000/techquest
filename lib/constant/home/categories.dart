import 'package:flutter/material.dart';

class TechCategory {
  final String name;
  final IconData icon;
  final Color color;
  final String url;

  TechCategory(
      {required this.name,
      required this.icon,
      required this.color,
      required this.url});

  static final List<TechCategory> categories = [
    TechCategory(
        name: 'Docker',
        icon: Icons.cloud_queue,
        color: Colors.blueGrey.shade50,
        url:
            'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/97_Docker_logo_logos-512.png'),
    TechCategory(
        name: 'SQL',
        icon: Icons.storage,
        color: Colors.lightGreen.shade50,
        url: 'https://cdn-icons-png.flaticon.com/256/11784/11784525.png'),
    TechCategory(
        name: 'Bash',
        icon: Icons.circle,
        color: Colors.blue.shade50,
        url:
            'https://img.icons8.com/?size=100&id=w8vzomb1oP2W&format=png&color=000000'),
    TechCategory(
        name: 'CMS',
        icon: Icons.code,
        color: Colors.pink.shade100,
        url: 'https://cdn-icons-png.flaticon.com/512/2867/2867263.png'),
    TechCategory(
        name: 'Linux',
        icon: Icons.flutter_dash_outlined,
        color: Colors.grey.shade300,
        url: 'https://icon-library.com/images/icon-linux/icon-linux-2.jpg'),
    TechCategory(
        name: 'Code',
        icon: Icons.flutter_dash_outlined,
        color: Colors.orange.shade100,
        url:
            'https://emroussel.gallerycdn.vsassets.io/extensions/emroussel/atomize-atom-one-dark-theme/1.5.0/1592929078909/Microsoft.VisualStudio.Services.Icons.Default'),
    TechCategory(
        name: 'DevOps',
        icon: Icons.flutter_dash_outlined,
        color: Colors.purple.shade100,
        url:
            'https://img.icons8.com/?size=100&id=BejoiOeRfYSo&format=png&color=000000'),
  ];
}
