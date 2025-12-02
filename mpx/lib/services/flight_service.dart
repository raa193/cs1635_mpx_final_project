import 'package:mpx/models/flight.dart';
import 'package:flutter/material.dart';
import 'package:mpx/services/aviationstack_service.dart';

class FlightService extends ChangeNotifier {
  Future<List<Flight>> fetchFlights(String apiKey) async {
    // getting flights from aviation stack
    final Map<String, dynamic> results = await AviationStackService(apiKey).getRawFlightInfo();

    // getting flights into list
    List<dynamic> flights = results['data'];
    return flights.map((flight) => Flight.fromJson(flight)).toList();
  }

  Future<List<Flight>> fetchTestFlights() async {
    // getting flights from local storage
    final json = await AviationStackService("N/A").loadTestFlightDataAsset();

    final List<dynamic> flights = json['data'];
    return flights.map((flight) => Flight.fromJson(flight)).toList();
  }
}
