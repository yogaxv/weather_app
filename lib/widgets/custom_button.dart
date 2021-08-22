import 'package:flutter/material.dart';
import 'package:weather_app/Constant/color_constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onPressed, required this.title, this.active = false});
  final GestureTapCallback onPressed;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: active ? ColorConstant.primaryBackground : Colors.white,
      elevation: 0,
      splashColor: ColorConstant.primaryBackground,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                  color: ColorConstant.primaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.5),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.arrow_right_sharp,
              color: ColorConstant.primaryText,
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: active
              ? BorderSide.none
              : BorderSide(color: ColorConstant.primaryText)),
    );
  }
}
