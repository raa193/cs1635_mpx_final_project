class FlightData {
  String? flightNum;
  String? iata;
  String? icao;

  FlightData({
    required this.flightNum,
    required this.iata,
    required this.icao,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) {
    return FlightData(
      flightNum: json['number'],
      iata: json['iata'],
      icao: json['icao'],
    );
  }
}