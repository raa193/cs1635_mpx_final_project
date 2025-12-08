import 'package:flutter/material.dart';
import 'package:mpx/services/flight_service.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';

class FlightListViewModel extends ChangeNotifier {
  List<FlightViewModel> flights = <FlightViewModel>[];
  List<FlightViewModel> filteredFlights = <FlightViewModel>[];

  String _departureQuery = '';
  String _arrivalQuery = '';
  String _statusQuery = '';

  bool isLoading = false;

  void setDepartureSearchQuery(String query) {
    _departureQuery = query.toLowerCase();
    _applyFilters();
  }

  void setArrivalSearchQuery(String query) {
    _arrivalQuery = query.toLowerCase();
    _applyFilters();
  }

  void setStatusSearchQuery(String query) {
    _statusQuery = query.toLowerCase();
    _applyFilters();
  }

  void _applyFilters() {
    filteredFlights = flights.where((flight) {
      final departureMatch = (
          (flight.departureData.getAirport()?.toLowerCase().contains(_departureQuery) ?? false)
        ) || (
          (flight.departureData.getIata()?.toLowerCase().contains(_departureQuery) ?? false)
        );
      final arrivalMatch = (
          (flight.arrivalData.getAirport()?.toLowerCase().contains(_arrivalQuery) ?? false)
        ) || (
          (flight.arrivalData.getIata()?.toLowerCase().contains(_arrivalQuery) ?? false)
        );  
      final flightStatus =
          flight.getFlightStatus()?.toLowerCase() ==
              _statusQuery.toLowerCase() ||
          _statusQuery.toLowerCase() == 'all';

      return departureMatch &&
          arrivalMatch &&
          flightStatus; // both conditions must be met
    }).toList();

    notifyListeners();
  }

  Future<void> fetchFlights(String apiKey) async {
    isLoading = true;
    notifyListeners();

    final results = await FlightService().fetchFlights(apiKey);

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();
    filteredFlights = List.from(flights);
    
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTestFlights() async {
    final results = await FlightService().fetchTestFlights();

    print("Fetched ${results.length} flights");

    flights = results.map((flight) => FlightViewModel(flight: flight)).toList();
    filteredFlights = List.from(flights);

    notifyListeners();
  }
}
