import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Hero(
                tag: 'img1',
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://img.lovepik.com/background/20211101/medium/lovepik-abstract-background-mobile-phone-wallpaper-image_400624615.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
