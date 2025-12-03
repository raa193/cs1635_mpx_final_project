import 'package:mpx/viewmodels/flight_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mpx/services/flight_service.dart';
import 'package:mpx/widgets/flight_list.dart';
import 'package:provider/provider.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  @override
  _FlightListViewState createState() => _FlightListViewState();
}

class _FlightListViewState extends State<FlightListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(child: FlightList(flights: vm.flights)),
        ],
      ),
    );
  }
}
