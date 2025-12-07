import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class AviationStackService {
  final String apiKey;

  AviationStackService(this.apiKey);

  Future<Map<String, dynamic>> getRawFlightInfo() async {
    final url = Uri.parse(
      'http://api.aviationstack.com/v1/flights?'
      'access_key=$apiKey'
      '&limit=200',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load flight data: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> loadTestFlightDataAsset() async {
    final jsonString = await rootBundle.loadString('assets/flight_data.json');
    return jsonDecode(jsonString);
  }
}
