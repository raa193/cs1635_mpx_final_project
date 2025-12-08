import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mpx/viewmodels/departure_data_view_model.dart';
import 'package:mpx/viewmodels/arrival_data_view_model.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:timezone/timezone.dart' as tz;

class FlightProgressBar extends StatefulWidget {
  final DepartureDataViewModel departure;
  final ArrivalDataViewModel arrival;

  const FlightProgressBar({
    required this.departure,
    required this.arrival,
    super.key,
  });

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

    _timer = Timer.periodic(Duration(seconds: 30), (_) {
      setState(() {
        _updateProgress();
      });
    });
  }

  void _updateProgress() {
    final departLocation = tz.getLocation(
      widget.departure.getTimezone() ?? 'UTC',
    );
    final arrivalLocation = tz.getLocation(
      widget.arrival.getTimezone() ?? 'UTC',
    );

    final departTime = tz.TZDateTime.parse(
      departLocation,
      widget.departure.getActualDepart()?.toIso8601String() ??
      widget.departure.getEstimatedDepart()?.toIso8601String() ??
      widget.departure.getScheduledDepart()?.toIso8601String() ??
          DateTime.now().toIso8601String(),
    ).toUtc();

    final arrivalTime = tz.TZDateTime.parse(
      arrivalLocation,
      widget.arrival.getActualArrival()?.toIso8601String() ??
      widget.arrival.getEstimatedArrival()?.toIso8601String() ??
      widget.arrival.getScheduledArrival()?.toIso8601String() ??
          DateTime.now()
              .add(Duration(hours: 2))
              .toIso8601String(),
    ).toUtc();

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
                width: width,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Progress bar
              Container(
                width: width * progress,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Plane icon
              Positioned(
                left: width * progress,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(
                    Icons.local_airport,
                    size: 24,
                    color: Colors.blueGrey,
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
