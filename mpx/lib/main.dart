import "package:flutter/material.dart";
import "package:mpx/l10n/app_localizations.dart";
import "package:mpx/viewmodels/flight_list_view_model.dart";
import "package:mpx/views/flight_list_view.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('es', ''),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        // Locale('el', ''), // Greek
      ],
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true),
      builder: (context, child) {
        final t = AppLocalizations.of(context)!;
        return Title(
          title: t.flightTrackerApplication,
          color: Colors.blue,
          child: child!,
        );
      },
      home: ChangeNotifierProvider(
        create: (context) => FlightListViewModel(),
        child: const FlightListView(),
      ),
    );
  }
}
