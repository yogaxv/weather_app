part of 'city_cubit.dart';

abstract class CityState {}

class Initial extends CityState {}

class Loading extends CityState {}

class Success extends CityState {
  final Cities cities;
  final String message;
  Success(this.cities, this.message);

  @override
  String toString() {
    return 'SuccessLoadAllProfileState{listProfiles: $cities, message: $message}';
  }
}

class Failure extends CityState {
  final String message;
  Failure(this.message);

  @override
  String toString() {
    return 'FailureLoadAllProfileState{errorMessage: $message}';
  }
}
