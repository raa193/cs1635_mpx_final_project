import 'package:flutter/foundation.dart';
import 'package:mpx/models/flight.dart';
import 'package:mpx/services/aviationstack_service.dart';

class FlightService extends ChangeNotifier {
  Future<List<Flight>> fetchFlights(String apiKey) async {
    // getting flights from aviation stack
    final Map<String, dynamic> results = await AviationStackService(
      apiKey,
    ).getRawFlightInfo();

    // getting flights into list
    List<Flight> flights = await compute<List<dynamic>, List<Flight>>(_parseFlightsFromResponse, results['data']);

    final Map<String, dynamic> activeResults = await AviationStackService(
      apiKey,
    ).getRawFlightInfoWithStatus("active");

    flights += await compute<List<dynamic>, List<Flight>>(_parseFlightsFromResponse, activeResults['data']);

    final Map<String, dynamic> cancelledResults = await AviationStackService(
      apiKey,
    ).getRawFlightInfoWithStatus("cancelled");

    flights += await compute<List<dynamic>, List<Flight>>(_parseFlightsFromResponse, cancelledResults['data']); 

    final Map<String, dynamic> landedResults = await AviationStackService(
      apiKey,
    ).getRawFlightInfoWithStatus("landed");

    flights += await compute<List<dynamic>, List<Flight>>(_parseFlightsFromResponse, landedResults['data']);

    return _removeDuplicateFlights(flights);
  }

  List<Flight> _removeDuplicateFlights(List<Flight> flights) {
    final seenFlightNumbers = <String>{};
    final uniqueFlights = <Flight>[];

    for (var flight in flights) {
      final flightNumber = flight.flightData.flightNum ?? '';

      if (!seenFlightNumbers.contains(flightNumber)) {
        seenFlightNumbers.add(flightNumber);
        uniqueFlights.add(flight);
      }
    }

    return uniqueFlights;
  }

  List<Flight> _parseFlightsFromResponse(List<dynamic> decoded) {
    return decoded.map((flight) => Flight.fromJson(flight)).toList();
  }

  Future<List<Flight>> fetchTestFlights() async {
    // getting flights from local storage
    final json = await AviationStackService("N/A").loadTestFlightDataAsset();

    final List<dynamic> flights = json['data'];
    return flights.map((flight) => Flight.fromJson(flight)).toList();
  }
}
