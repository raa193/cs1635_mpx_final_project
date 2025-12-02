import "package:flutter/material.dart";
import "package:mpx/viewmodels/flight_list_view_model.dart";
import "package:mpx/views/flight_list_view.dart";
import "package:provider/provider.dart";

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight Tracker Application",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true),
      home: ChangeNotifierProvider(
        create: (context) => FlightListViewModel(),
        child: const FlightListView(),
      ),
    );
  }
}
