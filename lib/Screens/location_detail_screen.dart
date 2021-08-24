import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Constant/color_constant.dart';
import 'package:weather_app/widgets/location_detail_card.dart';

class LocationDetailScreen extends StatefulWidget {
  LocationDetailScreen({Key? key}) : super(key: key);

  @override
  _LocationDetailScreenState createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Bogor",
            style: TextStyle(color: ColorConstant.primaryText),
          ),
        ),
        backgroundColor: ColorConstant.primaryBackground,
        foregroundColor: ColorConstant.primaryText,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorConstant.primaryText, //change your color here
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: Container(
          color: ColorConstant.primaryBackground,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25, left: 25),
                child: LocationDetailCard(),
              ),
              SizedBox(height: 50),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: ColorConstant.primaryText,
                selectedTextColor: ColorConstant.primaryBackground,
                // dateTextStyle: TextStyle(fontSize: 20),
                // dayTextStyle: TextStyle(fontSize: 10),
                // monthTextStyle: TextStyle(fontSize: 8),
                height: 90,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    // _selectedValue = date;
                  });
                },
              ),
            ],
          )),
    );
  }
}
