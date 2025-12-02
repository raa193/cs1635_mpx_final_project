import 'package:mpx/models/arrival_data.dart';

class ArrivalDataViewModel {
  final ArrivalData arrival;

  ArrivalDataViewModel({required this.arrival});

  String? getAirport() {
    return arrival.airport;
  }

  String? getIata() {
    return arrival.iata;
  }

  String? getIcao() {
    return arrival.icao;
  }

  String? getTerminal() {
    return arrival.terminal;
  }

  String? getGate() {
    return arrival.gate;
  }

  String? getBaggage() {
    return arrival.baggage;
  }

  DateTime? getScheduledArrival() {
    return arrival.scheduledArrival;
  }

  DateTime? getEstimatedArrival() {
    return arrival.estimatedArrival;
  }

  DateTime? getActualArrival() {
    return arrival.actualArrival;
  }
}
