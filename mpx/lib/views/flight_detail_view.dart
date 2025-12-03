import 'package:flutter/material.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';

class FlightDetailView extends StatelessWidget {
  final FlightViewModel flight;

  const FlightDetailView({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${flight.airlineData.getName()} Flight No. ${flight.flightData.getFlightDate() ?? "Erm"}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flight.arrivalData.getIata() ?? '-',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('M/d/y\nHH:mm').format(
                        flight.arrivalData.getScheduledArrival() ??
                            DateTime(0000),
                      ),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      flight.departureData.getIata() ?? '-',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('M/d/y\nHH:mm').format(
                        flight.departureData.getScheduledDepart() ??
                            DateTime(0000),
                      ),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
