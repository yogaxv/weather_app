import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Constant/color_constant.dart';
import 'package:weather_app/Screens/location_detail_screen.dart';
import 'package:weather_app/bloc/city/city_cubit.dart';
import 'package:weather_app/helpers/dio_helper.dart';
import 'package:weather_app/widgets/city_card.dart';
import 'package:weather_app/widgets/custom_button.dart';

class ChooseCityScreen extends StatefulWidget {
  ChooseCityScreen({Key? key}) : super(key: key);

  @override
  _ChooseCityScreenState createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  CityCubit citiesCubit = CityCubit(DioHelper());
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    citiesCubit.getCityList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
      body: BlocProvider<CityCubit>(
        create: (_) => citiesCubit,
        child: BlocListener<CityCubit, CityState>(
          listener: (_, state) {
            if (state is Failure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'ACTION',
                  onPressed: () {},
                ),
              ));
            }
          },
          child: BlocBuilder<CityCubit, CityState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                );
              } else if (state is Failure) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is Success) {
                var cityList = state.cities.list;
                return Container(
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
                          children: List.generate(cityList.length, (index) {
                            return index == 0
                                ? CityCard(
                                    city: cityList[index],
                                    active: true,
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LocationDetailScreen();
                                      }));
                                    },
                                  )
                                : CityCard(
                                    city: cityList[index],
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LocationDetailScreen();
                                      }));
                                    });
                          }),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
