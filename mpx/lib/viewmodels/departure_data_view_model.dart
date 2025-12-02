import 'package:mpx/models/departure_data.dart';

class DepartureDataViewModel {
  final DepartureData departure;

  DepartureDataViewModel({required this.departure});

  String? getAirport() {
    return departure.airport;
  }

  String? getIata() {
    return departure.iata;
  }

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
