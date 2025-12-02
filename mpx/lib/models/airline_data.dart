class AirlineData {
  final String name;
  final String iata;
  final String icao;

  AirlineData({
    required this.name,
    required this.iata,
    required this.icao
  });

  factory AirlineData.fromJson(Map<String, dynamic> json) {
    return AirlineData(
      name: json['name'],
      iata: json['iata'],
      icao: json['icao']
    );
  }
}
