import 'package:mpx/models/flight_data.dart';

class FlightDataViewModel {
  FlightData flightData;

  FlightDataViewModel({required this.flightData});

  String? getFlightDate() {
    return flightData.flightNum;
  }

  String? getIata() {
    return flightData.iata;
  }

  String? getIcao() {
    return flightData.icao;
  }
}
