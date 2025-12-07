import 'package:mpx/viewmodels/flight_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mpx/widgets/flight_list.dart';
import 'package:provider/provider.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  @override
  _FlightListViewState createState() => _FlightListViewState();
}

class _FlightListViewState extends State<FlightListView> {
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String apiKey = const String.fromEnvironment('API_KEY', defaultValue: '');
    // Provider.of<FlightListViewModel>(context, listen: false).fetchFlights(apiKey);
    Provider.of<FlightListViewModel>(context, listen: false).fetchTestFlights();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FlightListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flights", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Flexible(
                  flex: 1, // proportion of space
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _departureController,
                      decoration: const InputDecoration(
                        hintText: "Departure Airport",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => vm.setDepartureSearchQuery(value),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // space between fields
                // Arrival TextField
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _arrivalController,
                      decoration: const InputDecoration(
                        hintText: "Arrival Airport",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => vm.setArrivalSearchQuery(value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Flexible(
                  flex: 1, // proportion of space
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField(
                      initialValue: 'All',
                      items:
                          [
                                'All',
                                'Scheduled',
                                'Active',
                                'Landed',
                                'Cancelled',
                                'Incident',
                                'Diverted',
                              ]
                              .map(
                                (status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(
                                    status[0].toUpperCase() +
                                        status.substring(1),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          vm.setStatusSearchQuery(value);
                        } else {
                          vm.setStatusSearchQuery('');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: FlightList(flights: vm.filteredFlights)),
        ],
      ),
    );
  }
}
