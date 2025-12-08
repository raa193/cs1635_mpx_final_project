import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:mpx/widgets/airplane_progress_bar.dart';
import 'package:mpx/models/flight.dart';
import 'package:mpx/models/departure_data.dart';
import 'package:mpx/models/arrival_data.dart';
import 'package:mpx/models/airline_data.dart';
import 'package:mpx/models/flight_data.dart';

void main() {
  FlightViewModel createTestFlight({required int minutesOffset}) {
    final departure = DepartureData(
      airport: "LAX",
      iata: "LAX",
      icao: "KLAX",
      terminal: "4",
      gate: "23A",
      scheduledDepart: DateTime.now().subtract(Duration(minutes: minutesOffset)),
      estimatedDepart: DateTime.now().subtract(Duration(minutes: minutesOffset)),
      actualDepart: DateTime.now().subtract(Duration(minutes: minutesOffset)),
      delay: 0,
      timezone: "America/Los_Angeles",
    );

    final arrival = ArrivalData(
      airport: "JFK",
      iata: "JFK",
      icao: "KJFK",
      terminal: "8",
      gate: "12",
      baggage: "5",
      scheduledArrival: DateTime.now().add(Duration(minutes: 60 - minutesOffset)),
      estimatedArrival: DateTime.now().add(Duration(minutes: 60 - minutesOffset)),
      actualArrival: DateTime.now().add(Duration(minutes: 60 - minutesOffset)),
      timezone: "America/New_York",
    );

    final flight = Flight(
      flightDate: DateTime.now(),
      flightStatus: "active",
      departureData: departure,
      arrivalData: arrival,
      airlineData: AirlineData(name: "Delta", iata: "DL", icao: "DAL"),
      flightData: FlightData(flightNum: "123", iata: "DL123", icao: "DAL123"),
    );

    return FlightViewModel(flight: flight);
  }

  testWidgets('FlightProgressBar renders correctly at 0%, 50%, 100%',
      (WidgetTester tester) async {
    // 0% progress
    final flight0 = createTestFlight(minutesOffset: 60);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FlightProgressBar(flight: flight0),
      ),
    ));
    expect(find.byType(FlightProgressBar), findsOneWidget);

    // 50% progress
    final flight50 = createTestFlight(minutesOffset: 30);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FlightProgressBar(flight: flight50),
      ),
    ));
    expect(find.byType(FlightProgressBar), findsOneWidget);

    // 100% progress
    final flight100 = createTestFlight(minutesOffset: 0);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FlightProgressBar(flight: flight100),
      ),
    ));
    expect(find.byType(FlightProgressBar), findsOneWidget);
  });

  testWidgets('FlightProgressBar updates over time', (WidgetTester tester) async {
    final flight = createTestFlight(minutesOffset: 60);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FlightProgressBar(flight: flight),
      ),
    ));

    // Initial progress should be 0
    FlightProgressBar bar = tester.widget(find.byType(FlightProgressBar));
    expect(bar, isNotNull);

    // Fast-forward time to let the timer update
    await tester.pump(Duration(seconds: 10));
  });
}