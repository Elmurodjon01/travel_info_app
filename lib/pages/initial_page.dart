import 'package:flutter/material.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List images = [
    'img/welcome-one.png',
    'img/welcome-two.png',
    'img/welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '${images[index]}',
                ),
                fit: BoxFit.cover
              ),
            ),
          );
          },
      ),
    );
  }
}
