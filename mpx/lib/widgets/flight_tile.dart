import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/utils/parsing_utils.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';
import 'package:mpx/views/flight_detail_view.dart';

class FlightTile extends StatelessWidget {
  final FlightViewModel flight;

  const FlightTile({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FlightDetailView(flight: flight),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: const Color.fromARGB(255, 203, 202, 202), width: 2)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1), // expands the box
                    child: Icon(Icons.flight, size: 20),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  textAlign: TextAlign.right,
                  flight.airlineData.getName() ?? t.unknownAirline,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
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
                      flight.departureData.getAirport() ?? t.unknownAirport,
                      style: TextStyle(fontSize: 15),
                      softWrap: true,
                    ),
                    Text(
                      DateFormat('M/d/y\nHH:mm').format(
                        flight.departureData.getScheduledDepart() ??
                            DateTime(0000),
                      ),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      '${t.status}: ${getLocalizedStatus(flight.getFlightStatus()?.capitalize(), t) ?? t.unknown}',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    )
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
                      flight.arrivalData.getAirport() ?? t.unknownAirport,
                      style: TextStyle(fontSize: 15),
                      softWrap: true,
                    ),
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
          ],
        ),
      ),
    );
  }
}
