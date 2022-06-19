import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/reUsables/app_Button.dart';
import 'package:flutter_cubit/reUsables/boldText.dart';
import 'package:flutter_cubit/reUsables/intro_nonBoldText.dart';

class DetailedInfoPage extends StatefulWidget {
  const DetailedInfoPage({Key? key}) : super(key: key);

  @override
  State<DetailedInfoPage> createState() => _DetailedInfoPageState();
}

int gottenStars = 4;
int selectedIndex = -1;

class _DetailedInfoPageState extends State<DetailedInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 270,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.link),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: 'Yosemite',
                          textColor: Colors.black.withOpacity(0.8),
                        ),
                        ReusableText(
                          text: '\$ 250',
                          textColor: AppColors.mainColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        NonBoldText(
                          text: 'USA, California',
                          textColor: AppColors.textColor1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NonBoldText(
                            text: '(4.0)', textColor: AppColors.textColor2)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ReusableText(
                      text: 'People',
                      textColor: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    NonBoldText(
                        text: 'Number of people in your group',
                        textColor: AppColors.mainTextColor),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableText(
                      text: 'Description',
                      textColor: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NonBoldText(
                      text:
                          'You must go for travelling. Travelling helps get rid of pressure. Go to the mountains to see the nature',
                      textColor: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  AppButton(
                      color: AppColors.textColor2,
                      backColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor1,
                  isIcon: true,
                  icon: Icons.favorite_border,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
