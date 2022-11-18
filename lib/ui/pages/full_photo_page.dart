import 'package:flutter/material.dart';
import 'package:gallery_simple/domain/entity/photos.dart';

class ProfilePhotoPage extends StatelessWidget {
  final Photo photo;

  const ProfilePhotoPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24282F),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(photo.full, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
