// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get noFlights => 'Sin vuelos';

  @override
  String get flightTrackerApplication => 'Aplicación de Seguimiento de Vuelos';

  @override
  String get unknownAirline => 'Aerolínea Desconocida';

  @override
  String get unknownAirport => 'Aeropuerto Desconocido';

  @override
  String get status => 'Estado';

  @override
  String get unknown => 'Desconocido';

  @override
  String get all => 'Toda';

  @override
  String get scheduled => 'Programado';

  @override
  String get active => 'Activo';

  @override
  String get landed => 'Aterrizado';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get incident => 'Incidente';

  @override
  String get diverted => 'Desviado';

  @override
  String get flights => 'Vuelos';

  @override
  String get departureAirport => 'Aeropuerto de Salida';

  @override
  String get arrivalAirport => 'Aeropuerto de Llegada';

  @override
  String get flightNumber => 'N.º de vuelo';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Puerta';

  @override
  String get flightInformation => 'Información de Vuelo';

  @override
  String get baggageInformationUnannounced =>
      'La información sobre el equipaje aún no se ha anunciado...';
}
