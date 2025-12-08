import 'package:mpx/utils/parsing_utils.dart';

class DepartureData {
  final String? airport;
  final String? iata;
  final String? icao;
  final String? terminal;
  final String? gate;
  final int? delay;
  final DateTime? scheduledDepart;
  final DateTime? estimatedDepart;
  final DateTime? actualDepart;
  final String? timezone;

  DepartureData({
    required this.airport,
    required this.iata,
    required this.icao,
    required this.terminal,
    required this.gate,
    required this.delay,
    required this.scheduledDepart,
    required this.estimatedDepart,
    required this.actualDepart,
    required this.timezone,
  });

  factory DepartureData.fromJson(Map<String, dynamic> json) {
    return DepartureData(
      airport: json['airport'],
      iata: json['iata'],
      icao: json['iaco'],
      terminal: json['terminal'],
      gate: json['gate'],
      delay: json['delay'],
      estimatedDepart: safeParseDate(json['estimated']),
      scheduledDepart: safeParseDate(json['scheduled']),
      actualDepart: safeParseDate(json['actual']),
      timezone: json['timezone'],
    );
  }
}
