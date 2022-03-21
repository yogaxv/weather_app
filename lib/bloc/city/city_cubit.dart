import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/helpers/dio_helper.dart';
import 'package:weather_app/models/cities_model.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final DioHelper dioHelper;

  CityCubit(this.dioHelper) : super(Initial());

  void getCityList() async {
    emit(Loading());
    var result = await dioHelper.getCities(null, null);
    result.fold(
      (errorMessage) => emit(Failure(errorMessage)),
      (listCities) => emit(Success(listCities, listCities.message)),
    );
  }
}
