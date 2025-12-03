import 'package:flutter/material.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';

class FlightTile extends StatelessWidget {
  final String airline;

  final String arrivalAirport;
  final String departureAirport;

  final String arrivalTime;
  final String departureTime;

  const FlightTile({
    super.key,
    required this.airline,
    required this.arrivalAirport,
    required this.departureAirport,
    required this.arrivalTime,
    required this.departureTime,
  });

  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        print("FlightTile clicked!");
        
      },
      child: Container(
        padding: EdgeInsets.all(8),
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
                Text(textAlign: TextAlign.right, airline),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arrivalAirport,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      arrivalTime,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      departureAirport,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      departureTime,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
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
