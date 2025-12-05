import 'package:flutter/material.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';
import 'package:mpx/widgets/flight_tile.dart';

class FlightList extends StatelessWidget {
  final List<FlightViewModel> flights;
  final Function(FlightViewModel)? onFlightSelected;

  const FlightList({super.key, required this.flights, this.onFlightSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        final flight = flights[index];

        if (flights.isEmpty) {
          return const ListTile(title: Text("No flights"));
        }
        return FlightTile(flight: flight);
      },
    );
  }
}
