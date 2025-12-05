import 'package:flutter/material.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';
import 'package:mpx/views/flight_detail_view.dart';

class FlightTile extends StatelessWidget {
  final FlightViewModel flight;

  const FlightTile({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(width: 5)
                ,
                Text(
                  textAlign: TextAlign.right,
                  flight.airlineData.getName() ?? 'Unknown Airline',
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
                    Text(
                      flight.departureData.getIata() ?? '-',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      flight.departureData.getAirport() ?? 'Unknown Airport',
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
                      flight.arrivalData.getAirport() ?? 'Unknown Airport',
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
