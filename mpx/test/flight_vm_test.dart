import 'package:flutter_test/flutter_test.dart';
import 'package:mpx/models/flight.dart';
import 'package:mpx/models/departure_data.dart';
import 'package:mpx/models/arrival_data.dart';
import 'package:mpx/models/airline_data.dart';
import 'package:mpx/models/flight_data.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';

void main() {
  test('FlightViewModel exposes correct flight data', () {
    final departure = DepartureData(
      airport: "Los Angeles Intl",
      iata: "LAX",
      icao: "KLAX",
      terminal: "4",
      gate: "23A",
      delay: 10,
      scheduledDepart: DateTime.parse("2025-01-01T12:00:00Z"),
      estimatedDepart: DateTime.parse("2025-01-01T12:15:00Z"),
      actualDepart: null,
      timezone: "America/Los_Angeles",
    );

    final arrival = ArrivalData(
      airport: "JFK International",
      iata: "JFK",
      icao: "KJFK",
      terminal: "8",
      gate: "12",
      baggage: "5",
      scheduledArrival: DateTime.parse("2025-01-01T20:00:00Z"),
      estimatedArrival: DateTime.parse("2025-01-01T20:30:00Z"),
      actualArrival: null,
      timezone: "America/New_York",
    );

    final flight = Flight(
      flightDate: DateTime.parse("2025-01-01"),
      flightStatus: "active",
      departureData: departure,
      arrivalData: arrival,
      airlineData: AirlineData(name: "Delta", iata: "DL", icao: "DAL"),
      flightData: FlightData(flightNum: "123", iata: "DL123", icao: "DAL123"),
    );

    final vm = FlightViewModel(flight: flight);

    expect(vm.getFlightDate(), DateTime.parse("2025-01-01"));
    expect(vm.getFlightStatus(), "active");

    expect(vm.departureData.getIata(), "LAX");
    expect(vm.arrivalData.getIata(), "JFK");
    expect(vm.airlineData.getIata(), "DL");
    expect(vm.flightData.getFlightNumber(), "123");
  });
}