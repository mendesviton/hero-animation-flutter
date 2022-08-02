import 'package:flutter/material.dart';
import 'package:hero_animation/presenter/ui/view_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ViewImage()));
          },
          child: Hero(
            tag: 'img1',
            child: Image.network(
                height: 250,
                'https://img.lovepik.com/background/20211101/medium/lovepik-abstract-background-mobile-phone-wallpaper-image_400624615.jpg'),
          ),
        ),
      ),
    );
  }
}
