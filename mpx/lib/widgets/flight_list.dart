import 'package:flutter/material.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';

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

        return ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Text(
            DateFormat('M/d/y\nHH:mm').format(
              flight.departureData.getScheduledDepart() ?? DateTime(0000),
            ),
          ),
          title: Text(flight.departureData.getIata() ?? '-'),
          subtitle: Text(flight.arrivalData.getIata() ?? '-'),
          trailing: Text(
            DateFormat('M/d/y\nHH:mm').format(
              flight.arrivalData.getScheduledArrival() ?? DateTime(0000),
            ),
          ),
          onTap: () {
            if (onFlightSelected != null) {
              onFlightSelected!(flight);
            }
          },
        );
      },
    );
  }
}
