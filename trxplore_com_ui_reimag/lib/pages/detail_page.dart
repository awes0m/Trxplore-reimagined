import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/misc/colors.dart';
import 'package:trxplore_com_ui_reimag/utils/app_large_text.dart';
import 'package:trxplore_com_ui_reimag/utils/app_text.dart';
import 'package:trxplore_com_ui_reimag/utils/responsive_app_button.dart';

import '../utils/app_button.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int ratedStars = 3;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          //Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/mountain.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //icon and top bar
          Positioned(
              left: 20,
              top: 30,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.white))
                ],
              )),
          //Place Name holder background
          Positioned(
            top: 320,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Place Name and  price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargetext(
                          text: 'SomLand',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const AppLargetext(
                          text: '\$250',
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    //subtitle
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: 'SSE,SomeLand',
                            color: AppColors.mainTextColor),
                      ],
                    ),
                    //stars
                    const SizedBox(height: 10),
                    Row(children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            //index less than ratedStars, gets star color, rest get text color
                            color: index < ratedStars
                                ? AppColors.starColor
                                : AppColors.textColor1,
                          );
                        }),
                      ),
                      const AppText(text: "(4.0)", color: AppColors.textColor1),
                    ]),
                    //people
                    const SizedBox(height: 25),
                    AppLargetext(
                      text: 'People',
                      color: Colors.black.withOpacity(0.8),
                      size: 28,
                    ),
                    //No of people
                    const SizedBox(height: 5),
                    const AppText(
                        text: 'No. of people', color: AppColors.textColor1),
                    //No of people selector
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: AppSquareButton(
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: _selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                borderColor: AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //description
                    const SizedBox(height: 20),
                    AppLargetext(
                        text: 'Decoration',
                        color: Colors.black.withOpacity(0.8)),
                    const SizedBox(height: 20),
                    //description text
                    const AppText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      color: AppColors.mainTextColor,
                    ),
                    //book now button
                    const SizedBox(height: 20),
                  ]),
            ),
          ),
          //Bottom Buy Now Button
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppSquareButton(
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    size: 60,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const ResponsiveButton(
                    isResponsive: true,
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
