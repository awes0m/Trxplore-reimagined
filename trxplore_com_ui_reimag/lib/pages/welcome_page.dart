import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/misc/colors.dart';
import 'package:trxplore_com_ui_reimag/utils/app_large_text.dart';
import 'package:trxplore_com_ui_reimag/utils/app_text.dart';
import 'package:trxplore_com_ui_reimag/utils/responsive_app_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  List text = [
    'Welcome to Trxplore',
    'Trxplore is a platform for sharing your travel experiences',
    'and connecting with others who have the same interests,Enjoy the best travel experiences',
  ];

  List subtittle = [
    'Travel',
    'Live',
    'Explore',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite, //Takes amxium width available in screen
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/' + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargetext(
                          text: 'Trxplore',
                        ),
                        AppText(
                          text: subtittle[index],
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          //App text
                          width: 250,
                          child: AppText(
                            text: text[index],
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 24 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3)),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
