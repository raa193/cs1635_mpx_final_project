import 'package:flutter/material.dart';
import 'package:mpx/l10n/app_localizations.dart';
import 'package:mpx/providers/locale_provider.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${flight.airlineData.getName() ?? t.unknownAirline} ${t.flightNumber} ${flight.flightData.getFlightNumber() ?? "-"}',
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
            itemBuilder: (context) => const [
              PopupMenuItem(value: Locale('en'), child: Text('English')),
              PopupMenuItem(value: Locale('es'), child: Text('Español')),
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
                    child: 
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: FlightProgressBar(
                            departure:
                                flight.departureData.getScheduledDepart() ??
                                DateTime.now(),
                            arrival:
                                flight.arrivalData.getScheduledArrival() ??
                                DateTime.now().add(Duration(hours: 2)),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${t.flightInformation}: ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Baggage: ${flight.arrivalData.getBaggage() ?? t.baggageInformationUnannounced}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
