import 'package:mpx/models/airline_data.dart';

class AirlineDataViewModel {
  final AirlineData airlineData;

  AirlineDataViewModel({required this.airlineData});

  String? getName() {
    return airlineData.name;
  }

  String? getIata() {
    return airlineData.iata;
  }

  String? getIcao() {
    return airlineData.icao;
  }
}
