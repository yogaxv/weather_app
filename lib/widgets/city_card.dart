import 'package:flutter/material.dart';
import 'package:weather_app/Constant/color_constant.dart';

class CityCard extends StatelessWidget {
  const CityCard({Key? key, this.active = false, required this.onPressed})
      : super(key: key);

  final GestureTapCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      splashColor: ColorConstant.primaryText.withOpacity(0.2),
      fillColor: active
          ? ColorConstant.primaryBackground
          : ColorConstant.SecondaryBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bogor",
                  style: TextStyle(
                    color: ColorConstant.primaryText,
                    fontSize: 12.0,
                  ),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: new BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              "28\u2103",
              style: TextStyle(
                color: ColorConstant.primaryText,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "16 July 2021",
              style: TextStyle(
                color: ColorConstant.secondaryText,
                fontSize: 10.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
