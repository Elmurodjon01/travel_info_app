import 'package:flutter/material.dart';
import 'package:flutter_cubit/detailed_info/detailedInfo.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/reUsables/boldText.dart';
import 'package:flutter_cubit/reUsables/intro_nonBoldText.dart';
import 'package:flutter_cubit/reUsables/responsiveButton.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
final IntroInfo introInfo = IntroInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: introInfo.images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    '${introInfo.images[index]}',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(text: '${introInfo.typeOfTrip[index]}'),
                      NonBoldText(
                        text: '${introInfo.location[index]}',
                        size: 30,
                        textColor: Colors.black54,
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: NonBoldText(
                          size: 14.0,
                          textColor: AppColors.textColor2,
                          text: '${introInfo.detailedInfo[index]}',
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ResponsiveButton(width: 120,),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) => Container(
                      width: 8,
                      margin: const EdgeInsets.only(bottom: 2),
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.2),
                      ),
                    ),),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
