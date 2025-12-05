import 'package:mpx/models/airline_data.dart';

class AirlineDataViewModel {
  final AirlineData airlineData;

  AirlineDataViewModel({required this.airlineData});

  String? getName() {
    return airlineData.name;
  }

  //Airlines have their own IATA codes, which are two characters long
  String? getIata() {
    return airlineData.iata;
  }

   //Airlines have their own ICAO codes, which are three characters long
  String? getIcao() {
    return airlineData.icao;
  }

}
