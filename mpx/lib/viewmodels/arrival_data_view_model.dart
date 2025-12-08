import 'package:mpx/models/arrival_data.dart';

class ArrivalDataViewModel {
  final ArrivalData arrival;

  ArrivalDataViewModel({required this.arrival});

  //Return Airport Name
  String? getAirport() {
    return arrival.airport;
  }

  //Return Airport's IATA code (i.e. LAX, PIT, JFK)
  String? getIata() {
    return arrival.iata;
  }

  //Return Airport's ICAO code (i.e. KLAX, KPIT, KJFK)
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

    String? getTimezone() {
    return arrival.timezone;
  }
}
