import 'package:flutter/material.dart';
import 'package:mpx/services/flight_service.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';

class FlightListViewModel extends ChangeNotifier {
  List<FlightViewModel> flights = <FlightViewModel>[];
  List<FlightViewModel> filteredFlights = <FlightViewModel>[];

  String _departureQuery = '';
  String _arrivalQuery = '';

  void setDepartureSearchQuery(String query) {
    _departureQuery = query.toLowerCase();
    _applyFilters();
  }

  void setArrivalSearchQuery(String query) {
    _arrivalQuery = query.toLowerCase();
    _applyFilters();
  }

  void _applyFilters() {
    filteredFlights = flights.where((flight) {
      final departureMatch =
          flight.departureData?.getAirport()?.toLowerCase().contains(
            _departureQuery,
          ) ??
          true;
      final arrivalMatch =
          flight.arrivalData?.getAirport()?.toLowerCase().contains(
            _arrivalQuery,
          ) ??
          true;

      return departureMatch && arrivalMatch; // both conditions must be met
    }).toList();

    notifyListeners();
  }

  Future<void> fetchFlights(String apiKey) async {
    final results = await FlightService().fetchFlights(apiKey);

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();
    filteredFlights = List.from(flights);
  }

  Future<void> fetchTestFlights() async {
    final results = await FlightService().fetchTestFlights();

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();
    filteredFlights = List.from(flights);

    notifyListeners();
  }
}
