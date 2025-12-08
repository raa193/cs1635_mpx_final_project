import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mpx/models/flight.dart';
import 'package:mpx/viewmodels/departure_data_view_model.dart';
import 'package:mpx/viewmodels/arrival_data_view_model.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:timezone/timezone.dart' as tz;

class FlightProgressBar extends StatefulWidget {
  final FlightViewModel flight;

  const FlightProgressBar({required this.flight, super.key});

  @override
  _FlightProgressBarState createState() => _FlightProgressBarState();
}

class _FlightProgressBarState extends State<FlightProgressBar> {
  late double progress;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateProgress();

    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        _updateProgress();
      });
    });
  }

  void _updateProgress() {
    if (widget.flight.getFlightStatus()?.toLowerCase() == 'landed') {
      progress = 1;
      return;
    }

    DepartureDataViewModel departure = widget.flight.departureData;
    ArrivalDataViewModel arrival = widget.flight.arrivalData;

    final departTime =
        departure.getActualDepart() ??
        departure.getEstimatedDepart() ??
        departure.getScheduledDepart() ??
        DateTime.now();

    final arrivalTime =
        arrival.getActualArrival() ??
        arrival.getEstimatedArrival() ??
        arrival.getScheduledArrival() ??
        DateTime.now();

    final now = DateTime.now().toUtc();
    final total = arrivalTime.difference(departTime).inSeconds;
    final elapsed = now.difference(departTime).inSeconds;

    if (elapsed <= 0) {
      progress = 0;
    } else if (elapsed >= total) {
      progress = 1;
    } else {
      progress = elapsed / total;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return SizedBox(
          height: 30,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background bar
              Container(
                width: width - 5,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Progress bar
              Container(
                width: (width - 5) * progress,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Plane icon
              Positioned(
                left: (width - 20) * progress,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(
                    Icons.local_airport_outlined,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
