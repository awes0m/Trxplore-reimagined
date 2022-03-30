import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/misc/colors.dart';
import 'package:trxplore_com_ui_reimag/utils/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  const ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 8),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: AppText(text: 'Book Now', color: Colors.white),
                  )
                : Container(),
            Image.asset('assets/img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
