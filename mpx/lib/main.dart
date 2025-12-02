import "package:mpx/services/aviationstack_service.dart";
import 'package:mpx/models/flight.dart';

void main() async {
  final avs = AviationStackService("23e2044ce62a590506bca8c42a60eef4");

  // try {
  //   final data = await avs.getRawFlightInfo();
  // } catch (e) {
  //   print("Error: $e");
  // }

  List<Flight> flightData = avs.loadTestFlightDataAsset();

  

}
