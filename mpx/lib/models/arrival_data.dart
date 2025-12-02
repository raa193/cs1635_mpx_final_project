class ArrivalData {
  final String? airport;
  final String? iata;
  final String? icao;
  final String? terminal;
  final String? gate;
  final String? baggage;
  final DateTime? scheduledArrival;
  final DateTime? estimatedArrival;
  final DateTime? actualArrival;

  ArrivalData({
    required this.airport,
    required this.iata,
    required this.icao,
    required this.terminal,
    required this.gate,
    required this.baggage,
    required this.scheduledArrival,
    required this.estimatedArrival,
    required this.actualArrival,
  });

  factory ArrivalData.fromJson(Map<String, dynamic> json) {
    return ArrivalData(
      airport: json['airport'],
      iata: json['iata'],
      icao: json['iaco'],
      terminal: json['terminal'],
      gate: json['gate'],
      baggage: json['baggage'],
      estimatedArrival: DateTime.parse(json['estimated']),
      scheduledArrival: DateTime.parse(json['scheduled']),
      actualArrival: DateTime.parse(json['actual']),
    );
  }
}
