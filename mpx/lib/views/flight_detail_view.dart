import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/providers/locale_provider.dart';
import 'package:mpx/utils/parsing_utils.dart';
import 'package:mpx/viewmodels/flight_view_model.dart';
import 'package:intl/intl.dart';
import 'package:mpx/widgets/airplane_progress_bar.dart';
import 'package:provider/provider.dart';

class FlightDetailView extends StatelessWidget {
  final FlightViewModel flight;

  const FlightDetailView({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    String statusText;
    String status = statusText = flight.getFlightStatus() ?? 'unknown';

    if(status.toLowerCase() == 'scheduled') {
      statusText = "${t.flightScheduledMessage} ${DateFormat('HH:mm').format(flight.departureData.getScheduledDepart() ?? DateTime(0000))}";
    } else if (status.toLowerCase() == 'active') {
      statusText = t.flightActiveMessage;
    } else if (status.toLowerCase() == 'landed') {
      statusText = t.flightLandedMessage;
    } else if (status.toLowerCase() == 'cancelled') {
      statusText = t.flightCancelledMessage;
    } else if (status.toLowerCase() == 'diverted') {
      statusText = t.flightDivertedMessage;
    } else {
      statusText = t.flightStatusUnknownMessage;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${flight.airlineData.getIcao() ?? t.unknownAirline} ${t.flightNumber} ${flight.flightData.getFlightNumber() ?? "-"}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              Provider.of<LocaleProvider>(
                context,
                listen: false,
              ).setLocale(locale);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: const Locale('en'),
                child: Text(
                  String.fromCharCode(0x1F1FA) + String.fromCharCode(0x1F1F8),
                ),
              ),
              PopupMenuItem(
                value: Locale('es'),
                child: Text(
                  String.fromCharCode(0x1F1EA) + String.fromCharCode(0x1F1F8),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ~~~~~~~~~~ DEPARTURE INFORMATION ~~~~~~~~~~
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // to coerce row to stay to the left of the screen
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                flight.departureData.getIata() ?? '-',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Icon(Icons.flight_takeoff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${t.terminal} ${flight.departureData.getTerminal() ?? '-'}',
                        ),
                        Text(
                          '${t.gate} ${flight.departureData.getGate() ?? '-'}',
                        ),
                        Text(
                          DateFormat('M/d/y\nHH:mm').format(
                            flight.departureData.getScheduledDepart() ??
                                DateTime(0000),
                          ),
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FlightProgressBar(
                        flight: flight,
                      ),
                    ),
                  ),
                  // ~~~~~~~~~~ ARRIVAL INFORMATION ~~~~~~~~~~
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //to coerce row to stay to the right of the screen
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Icon(Icons.flight_land),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                flight.arrivalData.getIata() ?? '-',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${t.terminal} ${flight.arrivalData.getTerminal() ?? '-'}',
                        ),
                        Text(
                          '${t.gate} ${flight.arrivalData.getGate() ?? '-'}',
                        ),
                        Text(
                          DateFormat('M/d/y\nHH:mm').format(
                            flight.arrivalData.getScheduledArrival() ??
                                DateTime(0000),
                          ),
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              t.arrivalInformation,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1),
            Text(statusText, style: TextStyle(fontSize: 18, color: getStatusColor(status))),
            SizedBox(height: 10),
            Row(
              spacing: 5,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.flight_land, size: 80),
                        ),
                        SizedBox(width: 5),
                        Text(
                          DateFormat('HH:mm').format(
                            flight.arrivalData.getActualArrival() ??
                                flight.arrivalData.getEstimatedArrival() ??
                                flight.arrivalData.getScheduledArrival() ??
                                DateTime(0000),
                          ),
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.place, size: 80),
                        ),
                        SizedBox(width: 15),
                        Text(
                          flight.arrivalData.getIata() ?? "-",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              spacing: 5,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.local_airport, size: 80),
                        ),
                        SizedBox(width: 5),
                        Text(
                          flight.airlineData.getIcao() ?? "-",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.luggage, size: 80),
                        ),
                        SizedBox(width: 15),
                        Text(
                          flight.arrivalData.getBaggage() ?? "-",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
