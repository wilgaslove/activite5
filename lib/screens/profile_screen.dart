import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 10),
          Text('Nom: Wilfried Adjovi'),
          Text('Email: wilfried@example.com'),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Modifier profil')),
          TextButton(onPressed: () {}, child: Text('Se déconnecter')),
        ],
      ),
    );
  }
}