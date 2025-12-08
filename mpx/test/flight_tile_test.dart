import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/models/airline_data.dart';
import 'package:mpx/models/arrival_data.dart';
import 'package:mpx/models/departure_data.dart';
import 'package:mpx/models/flight_data.dart';
import 'package:mpx/widgets/flight_tile.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:mpx/models/flight.dart';


void main() {
  testWidgets('FlightTile displays airline, departure, arrival, and status', (WidgetTester tester) async {
    // Create fake flight data
    final flight = Flight(
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
      flightData: FlightData(flightNum: "123", iata: "DL123", icao: "DAL123")
    );

    final flightVM = FlightViewModel(flight: flight);

    // Wrap the FlightTile in MaterialApp with localization
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: FlightTile(flight: flightVM),
        ),
      ),
    );

    // Wait for widgets to settle
    await tester.pumpAndSettle();

    // Assertions
    expect(find.text('Delta'), findsOneWidget);
    expect(find.text('LAX'), findsOneWidget);
    expect(find.text('JFK'), findsOneWidget);
    expect(find.text('Status: Scheduled'), findsOneWidget);
  });
}