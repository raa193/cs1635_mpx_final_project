import 'package:mpx/models/departure_data.dart';
import 'package:mpx/models/arrival_data.dart';
import 'package:mpx/models/airline_data.dart';
import 'package:mpx/models/flight_data.dart';

class Flight {
  final DateTime? flightDate;
  final String? flightStatus;
  final DepartureData departureData;
  final ArrivalData arrivalData;
  final AirlineData airlineData;
  final FlightData flightData;

  Flight({
    required this.flightDate,
    required this.flightStatus,
    required this.departureData,
    required this.arrivalData,
    required this.airlineData,
    required this.flightData,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    DepartureData departure = DepartureData.fromJson(json['departure']);
    ArrivalData arrival = ArrivalData.fromJson(json['arrival']);
    AirlineData airline = AirlineData.fromJson(json['airline']);
    FlightData flight = FlightData.fromJson(json['flight']);

    return Flight(
      flightDate: DateTime.parse(json['flight_date']),
      flightStatus: json['flight_status'],
      departureData: departure,
      arrivalData: arrival,
      airlineData: airline,
      flightData: flight,
    );
  }
}
