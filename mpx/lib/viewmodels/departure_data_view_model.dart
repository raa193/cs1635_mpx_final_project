import 'package:mpx/models/departure_data.dart';

class DepartureDataViewModel {
  final DepartureData departure;

  DepartureDataViewModel({required this.departure});

  //Return Airport Name
  String? getAirport() {
    return departure.airport;
  }

  //Return Airport's IATA code (i.e. LAX, PIT, JFK)
  String? getIata() {
    return departure.iata;
  }

  //Return Airport's ICAO code (i.e. KLAX, KPIT, KJFK)
  String? getIcao() {
    return departure.icao;
  }

  String? getTerminal() {
    return departure.terminal;
  }

  String? getGate() {
    return departure.gate;
  }

  int? getDelay() {
    return departure.delay;
  }

  DateTime? getScheduledDepart() {
    return departure.scheduledDepart;
  }

  DateTime? getEstimatedDepart() {
    return departure.estimatedDepart;
  }

  DateTime? getActualDepart() {
    return departure.actualDepart;
  }
}
