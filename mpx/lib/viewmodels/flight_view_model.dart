import 'package:mpx/models/flight.dart';
import 'package:mpx/viewmodels/departure_data_view_model.dart';
import 'package:mpx/viewmodels/arrival_data_view_model.dart';
import 'package:mpx/viewmodels/airline_data_view_model.dart';
import 'package:mpx/viewmodels/flight_data_view_model.dart';

class FlightViewModel {
  final Flight flight;

  FlightViewModel({required this.flight});

  late final DepartureDataViewModel departureData = DepartureDataViewModel(
    departure: flight.departureData,
  );

  late final ArrivalDataViewModel arrivalData = ArrivalDataViewModel(
    arrival: flight.arrivalData,
  );

  late final AirlineDataViewModel airlineData = AirlineDataViewModel(
    airlineData: flight.airlineData,
  );

  late final FlightDataViewModel flightData = FlightDataViewModel(
    flightData: flight.flightData,
  );

  DateTime? getFlightDate() {
    return flight.flightDate;
  }

  String? getFlightStatus() {
    return flight.flightStatus;
  }
}
