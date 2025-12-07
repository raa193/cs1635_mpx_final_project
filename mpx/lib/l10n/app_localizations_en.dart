// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get noFlights => 'No Flights';

  @override
  String get flightTrackerApplication => 'Flight Tracker Application';

  @override
  String get unknownAirline => 'Unknown Airline';

  @override
  String get unknownAirport => 'Unknown Airport';

  @override
  String get status => 'Status';

  @override
  String get unknown => 'Unknown';

  @override
  String get all => 'All';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get active => 'Active';

  @override
  String get landed => 'Landed';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get incident => 'Incident';

  @override
  String get diverted => 'Diverted';

  @override
  String get flights => 'Flights';

  @override
  String get departureAirport => 'Departure Airport';

  @override
  String get arrivalAirport => 'Arrival Airport';

  @override
  String get flightNumber => 'Flight Number';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Gate';

  @override
  String get flightInformation => 'Flight Information';

  @override
  String get baggageInformationUnannounced =>
      'Baggage Information has not been announced yet...';
}
