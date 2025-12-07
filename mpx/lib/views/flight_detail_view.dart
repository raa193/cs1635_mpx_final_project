import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';

class FlightDetailView extends StatelessWidget {
  final FlightViewModel flight;

  const FlightDetailView({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${flight.airlineData.getName() ?? t.unknownAirline} ${t.flightNumber} ${flight.flightData.getFlightNumber() ?? "Erm"}',
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
                      Row(
                        children:  [
                          Text(
                            flight.departureData.getIata() ?? '-',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Icon(Icons.flight_takeoff)
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${t.terminal} ${flight.departureData.getTerminal() ?? '-'}',
                      ),
                      Text('${t.gate} ${flight.departureData.getGate() ?? '-'}'),
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
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Icon(Icons.flight_land)
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            flight.arrivalData.getIata() ?? '-',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${t.terminal} ${flight.arrivalData.getTerminal() ?? '-'}',
                      ),
                      Text('${t.gate} ${flight.arrivalData.getGate() ?? '-'}'),
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
                  "${t.flightInformation}: ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  flight.arrivalData.getBaggage() ??
                      t.baggageInformationUnannounced,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
