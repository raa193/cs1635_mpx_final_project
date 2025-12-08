import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/models/airline_data.dart';
import 'package:mpx/models/arrival_data.dart';
import 'package:mpx/models/departure_data.dart';
import 'package:mpx/models/flight_data.dart';
import 'package:mpx/widgets/flight_list.dart';
import 'package:mpx/widgets/flight_tile.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:mpx/models/flight.dart';
import 'package:provider/provider.dart';
import 'package:mpx/viewmodels/flight_list_view_model.dart';

class FakeFlightListViewModel extends ChangeNotifier
    implements FlightListViewModel {
  @override
  Future<void> fetchFlights(String apiKey) async {
    // Do nothing
    return;
  }

  @override
  void setArrivalSearchQuery(String query) {}

  @override
  void setDepartureSearchQuery(String query) {}

  @override
  void setStatusSearchQuery(String query) {}

  @override
  List<FlightViewModel> get flights => [];

  @override
  List<FlightViewModel> filteredFlights = [];

  @override
  bool isLoading = false;

  @override
  Future<void> fetchTestFlights() async {}
  
  @override
  set flights(List<FlightViewModel> _flights) {
    // TODO: implement flights
  }
}

void main() {
  testWidgets('FlightList renders FlightTile widgets', (
    WidgetTester tester,
  ) async {
    // Create a list of fake flights
    final flight1 = FlightViewModel(
      flight: Flight(
        flightDate: DateTime(2025, 12, 7),
        flightStatus: 'scheduled',
        departureData: DepartureData(
          airport: 'Los Angeles International',
          iata: 'LAX',
          icao: 'KLAX',
          terminal: '1',
          gate: 'A10',
          delay: 0,
          scheduledDepart: DateTime(2025, 12, 7, 14, 0),
          estimatedDepart: DateTime(2025, 12, 7, 14, 0),
          actualDepart: null,
          timezone: 'PST',
        ),
        arrivalData: ArrivalData(
          airport: 'John F Kennedy Intl',
          iata: 'JFK',
          icao: 'KJFK',
          terminal: '4',
          gate: 'B20',
          baggage: '5',
          scheduledArrival: DateTime(2025, 12, 7, 22, 0),
          estimatedArrival: DateTime(2025, 12, 7, 22, 0),
          actualArrival: null,
          timezone: 'EST',
        ),
        airlineData: AirlineData(name: "Delta", iata: "DL", icao: "DAL"),
        flightData: FlightData(flightNum: "123", iata: "DL123", icao: "DAL123"),
      ),
    );

    final flight2 = FlightViewModel(
      flight: Flight(
        flightDate: DateTime(2025, 12, 8),
        flightStatus: 'delayed',
        departureData: DepartureData(
          airport: 'San Francisco Intl',
          iata: 'SFO',
          icao: 'KSFO',
          terminal: '2',
          gate: 'C15',
          delay: 30,
          scheduledDepart: DateTime(2025, 12, 8, 16, 0),
          estimatedDepart: DateTime(2025, 12, 8, 16, 30),
          actualDepart: null,
          timezone: 'PST',
        ),
        arrivalData: ArrivalData(
          airport: 'Chicago O\'Hare',
          iata: 'ORD',
          icao: 'KORD',
          terminal: '3',
          gate: 'D22',
          baggage: '7',
          scheduledArrival: DateTime(2025, 12, 8, 22, 0),
          estimatedArrival: DateTime(2025, 12, 8, 22, 30),
          actualArrival: null,
          timezone: 'CST',
        ),
        airlineData: AirlineData(
          name: 'United Airlines',
          iata: 'UA',
          icao: 'UAL',
        ),
        flightData: FlightData(flightNum: 'UA456', iata: 'UA', icao: 'UAL'),
      ),
    );

    final flights = [flight1, flight2];

    // Build the FlightList widget with provider and localization
    await tester.pumpWidget(
      ChangeNotifierProvider<FlightListViewModel>(
        create: (_) => FakeFlightListViewModel(),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: FlightList(flights: flights)),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that FlightTile widgets are present
    expect(find.byType(FlightTile), findsNWidgets(2));

    // Verify flight details
    expect(find.text('Delta'), findsOneWidget);
    expect(find.text('United Airlines'), findsOneWidget);
    expect(find.text('LAX'), findsOneWidget);
    expect(find.text('JFK'), findsOneWidget);
    expect(find.text('SFO'), findsOneWidget);
    expect(find.text('ORD'), findsOneWidget);
  });
}
