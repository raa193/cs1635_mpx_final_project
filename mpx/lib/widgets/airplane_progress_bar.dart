import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class FlightProgressBar extends StatefulWidget {
  final DateTime departure;
  final DateTime arrival;

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
    final now = DateTime.now();
    final total = widget.arrival.difference(widget.departure).inSeconds;
    final elapsed = now.difference(widget.departure).inSeconds;

    if (elapsed <= 0)
      progress = 0;
    else if (elapsed >= total)
      progress = 1;
    else
      progress = elapsed / total;
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
                left: width * progress - 12,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(Icons.flight, size: 24, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
