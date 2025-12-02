import 'package:mpx/models/flight.dart';
import 'package:flutter/material.dart';
import 'package:mpx/services/aviationstack_service.dart';

class FlightService extends ChangeNotifier {
  Future<List<Flight>> fetchFlights(String apiKey) async {
    // getting flights from aviation stack
    final results = await AviationStackService(apiKey).getRawFlightInfo();
    final List<dynamic> flights = results['data'];

    // getting flights into list
    List<Flight> flightList = [];
    flightList.addAll(flights.map((flight) => Flight.fromJson(flight)));

    return flightList;
  }

  Future<List<Flight>> fetchTestFlights() async {
    // getting flights from local storage
    final json = await AviationStackService("N/A").loadTestFlightDataAsset();
    final List<dynamic> flights = json['data'];

    // getting flights into list
    List<Flight> flightList = [];
    flightList.addAll(flights.map((flight) => Flight.fromJson(flight)));

    return flightList;
  }
}
