import "package:flutter/material.dart";
import "package:mpx/l10n/app_localizations.dart";
import "package:mpx/providers/locale_provider.dart";
import "package:mpx/viewmodels/flight_list_view_model.dart";
import "package:mpx/views/flight_list_view.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => FlightListViewModel()),
      ],
      child: const App(),
    ),
  );
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      locale: localeProvider.locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      builder: (context, child) {
        final t = AppLocalizations.of(context)!;
        return Title(
          title: t.flightTrackerApplication,
          color: Colors.blue,
          child: child!,
        );
      },
      home: const FlightListView(),
    );
  }
}