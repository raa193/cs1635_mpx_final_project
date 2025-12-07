import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:mpx/widgets/flight_tile.dart';

class FlightList extends StatelessWidget {
  final List<FlightViewModel> flights;
  final Function(FlightViewModel)? onFlightSelected;

  const FlightList({super.key, required this.flights, this.onFlightSelected});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return RefreshIndicator(
      onRefresh: () async {
        // Placeholder for refresh logic
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];

          if (flights.isEmpty) {
            return ListTile(title: Text(t.noFlights));
          }
          return FlightTile(flight: flight);
        },
      ),
    );
  }
}
