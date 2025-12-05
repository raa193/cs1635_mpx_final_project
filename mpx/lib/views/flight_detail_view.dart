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
          '${flight.airlineData.getName() ?? 'Unknown Airline'} Flight No. ${flight.flightData.getFlightDate() ?? "Erm"}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ~~~~~~~~~~ DEPARTURE INFORMATION ~~~~~~~~~~
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flight.departureData.getIata() ?? '-',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Terminal ${flight.departureData.getTerminal() ?? '-'}',
                      ),
                      Text('Gate ${flight.departureData.getGate() ?? '-'}'),
                      Text(
                        DateFormat('M/d/y\nHH:mm').format(
                          flight.departureData.getScheduledDepart() ??
                              DateTime(0000),
                        ),
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),

                  // ~~~~~~~~~~ ARRIVAL INFORMATION ~~~~~~~~~~
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        flight.arrivalData.getIata() ?? '-',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Terminal ${flight.arrivalData.getTerminal() ?? '-'}',
                      ),
                      Text('Gate ${flight.arrivalData.getGate() ?? '-'}'),
                      Text(
                        DateFormat('M/d/y\nHH:mm').format(
                          flight.arrivalData.getScheduledArrival() ??
                              DateTime(0000),
                        ),
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flight Information: ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  flight.arrivalData.getBaggage() ??
                      "Baggage Information has not been announced yet...",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
