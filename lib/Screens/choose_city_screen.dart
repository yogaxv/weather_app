import 'package:flutter/material.dart';
import 'package:weather_app/Constant/color_constant.dart';
import 'package:weather_app/widgets/city_card.dart';
import 'package:weather_app/widgets/custom_button.dart';

class ChooseCityScreen extends StatefulWidget {
  ChooseCityScreen({Key? key}) : super(key: key);

  @override
  _ChooseCityScreenState createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorConstant.primaryText, //change your color here
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications_outlined,
                color: ColorConstant.primaryText,
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(right: 70, left: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose a City",
              style: TextStyle(
                color: ColorConstant.primaryText,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                "Select a city or country to see\nthe weather",
                style: TextStyle(
                  color: ColorConstant.primaryText,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: double.infinity,
              child: CustomButton(
                active: true,
                title: "Add the city to favorites",
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              height: 50,
              width: double.infinity,
              child: CustomButton(
                title: "See the weather for the weeks",
                onPressed: () {},
              ),
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(4, (index) {
                  return index == 0
                      ? CityCard(
                          active: true,
                          onPressed: () {},
                        )
                      : CityCard(onPressed: () {});
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
