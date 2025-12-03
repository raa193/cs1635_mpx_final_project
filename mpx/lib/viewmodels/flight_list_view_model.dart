import 'package:flutter/material.dart';
import 'package:mpx/services/flight_service.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';

class FlightListViewModel extends ChangeNotifier {
  List<FlightViewModel> flights = <FlightViewModel>[];

  Future<void> fetchFlights(String apiKey) async {
    final results = await FlightService().fetchFlights(apiKey);

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();
}

  Future<void> fetchTestFlights() async {
    final results = await FlightService().fetchTestFlights();

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();

    notifyListeners();
  }
}
